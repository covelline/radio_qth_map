import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/repository/auth_state_notifier.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _emailSendStatus = ValueNotifier(_EmailAddressSendStatus.initial);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            title: TextButton(
              child: const Text('QTH map'),
              onPressed: () {
                context.go('/');
              },
            ),
          ),
          SliverToBoxAdapter(
            child: MaxWidthBox(
              maxWidth: 1200,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login_signup,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!.signup_description,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(AppLocalizations.of(context)!.login_descirption),
                    const SizedBox(
                      height: 4,
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/terms');
                      },
                      child: Text(AppLocalizations.of(context)!.terms_of_use),
                    ),
                    _EmailAddressForm(
                      sendStatusChanged: (status) {
                        _emailSendStatus.value = status;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ValueListenableBuilder(
                        valueListenable: _emailSendStatus,
                        builder: (context, value, _) {
                          if (value == _EmailAddressSendStatus.completed) {
                            return Text(AppLocalizations.of(context)!
                                .send_email_complete);
                          }
                          if (value == _EmailAddressSendStatus.error) {
                            return Text(
                              AppLocalizations.of(context)!.send_email_error,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            );
                          }
                          return Container();
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailAddressForm extends StatefulWidget {
  const _EmailAddressForm({
    required this.sendStatusChanged,
  });
  final ValueChanged<_EmailAddressSendStatus> sendStatusChanged;

  @override
  State<_EmailAddressForm> createState() => _EmailAddressFormState();
}

class _EmailAddressFormState extends State<_EmailAddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFormController = TextEditingController();
  var _sendStatus = _EmailAddressSendStatus.initial;
  var _isChecked = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.sendStatusChanged(_sendStatus);
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthStateNotifier>().auth;
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            Text(AppLocalizations.of(context)!.agree_to_terms),
          ],
        ),
        Form(
            key: _formKey,
            child: ResponsiveRowColumn(
              rowSpacing: 8,
              layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 3,
                  child: TextFormField(
                    controller: _emailFormController,
                    decoration: InputDecoration(
                        label:
                            Text(AppLocalizations.of(context)!.mail_address)),
                    validator: (value) {
                      final result = EmailValidator.validate(value ?? '');
                      if (result) {
                        return null;
                      }
                      return AppLocalizations.of(context)!
                          .enter_your_email_address;
                    },
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: FilledButton.icon(
                    onPressed: _sendStatus == _EmailAddressSendStatus.initial &&
                            _isChecked
                        ? () async {
                            if (_formKey.currentState?.validate() == true) {
                              setState(() {
                                _sendStatus = _EmailAddressSendStatus.sending;
                                widget.sendStatusChanged(_sendStatus);
                              });
                              try {
                                final setting = ActionCodeSettings(
                                  url: '${Uri.base.origin}/verification',
                                  handleCodeInApp: true,
                                );
                                setState(() {
                                  _sendStatus =
                                      _EmailAddressSendStatus.completed;
                                  widget.sendStatusChanged(_sendStatus);
                                });
                                final sharedPreferences =
                                    await SharedPreferences.getInstance();
                                await sharedPreferences.setString(
                                    'emailForSigninLink',
                                    _emailFormController.text);
                                await auth.sendSignInLinkToEmail(
                                    email: _emailFormController.text,
                                    actionCodeSettings: setting);
                              } catch (e) {
                                debugPrint("failed send $e");
                                setState(() {
                                  _sendStatus = _EmailAddressSendStatus.error;
                                  widget.sendStatusChanged(_sendStatus);
                                });
                              }
                            }
                          }
                        : null,
                    icon: const Icon(Icons.send),
                    label: Text(AppLocalizations.of(context)!.send),
                  ),
                )
              ],
            )),
      ],
    );
  }
}

enum _EmailAddressSendStatus {
  initial,
  sending,
  completed,
  error,
  ;
}
