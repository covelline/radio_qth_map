import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/repository/locale_notifier.dart';
import 'package:radio_qth_map/widget/login_text_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroduceScreen extends StatelessWidget {
  const IntroduceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 400,
              title: const Text('QTH map'),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('image/preview_image.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                """QTH map | ${AppLocalizations.of(context)!.app_description}""",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              FilledButton.tonal(
                                onPressed: () {
                                  context.go('/map');
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.try_map_now,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    showLicensePage(context: context);
                  },
                  child: Text(AppLocalizations.of(context)!.license),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/terms');
                  },
                  child: Text(AppLocalizations.of(context)!.terms_of_use),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(
                          "https://docs.google.com/forms/d/e/1FAIpQLSed4yjxKosyZq_LSV7APdRxKPwTr9DgP8TJD4_JagpwyQk9VA/viewform"),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.contact_us),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://twitter.com/numa_radio"));
                  },
                  child: SvgPicture.asset(
                    'image/x-twitter.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                DropdownButton<Locale>(
                  value: Locale(AppLocalizations.of(context)!.localeName),
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: Locale('ja'),
                      child: Text('日本語'),
                    ),
                  ],
                  onChanged: (newLocale) {
                    if (newLocale != null) {
                      context.read<LocaleNotifier>().changeLocale(newLocale);
                    }
                  },
                ),
                const LoginTextButton(),
              ],
            ),
            SliverToBoxAdapter(
              child: MaxWidthBox(
                maxWidth: 1200,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ResponsiveRowColumn(
                    rowMainAxisAlignment: MainAxisAlignment.center,
                    rowMainAxisSize: MainAxisSize.max,
                    rowCrossAxisAlignment: CrossAxisAlignment.start,
                    rowSpacing: 24,
                    columnSpacing: 24,
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.menu_book,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .introduce_for_logging_title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .introduce_for_logging,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.map,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .introduce_for_mapping_title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .introduce_for_mapping,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.switch_access_shortcut,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .introduce_for_experience_title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .introduce_for_experience,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                    ),
                    onPressed: () {
                      context.go('/map');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.try_map_now,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverToBoxAdapter(
              child: MaxWidthBox(
                maxWidth: 1200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ResponsiveRowColumn(
                      rowMainAxisAlignment: MainAxisAlignment.center,
                      rowMainAxisSize: MainAxisSize.max,
                      rowCrossAxisAlignment: CrossAxisAlignment.start,
                      rowSpacing: 24,
                      columnSpacing: 24,
                      layout:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Text(
                            AppLocalizations.of(context)!
                                .introduce_for_community,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.about_me,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text('JK1TUT'),
                                  TextButton(
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          "https://twitter.com/numa_radio"));
                                    },
                                    child: const Text('X(Twitter)'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      launchUrl(
                                        Uri.parse(
                                            "https://www.qrz.com/db/JK1TUT"),
                                      );
                                    },
                                    child: const Text('QRZ.com'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      launchUrl(
                                        Uri.parse(
                                            'https://github.com/covelline/radio_qth_map'),
                                      );
                                    },
                                    child: const Text('Github.com'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 56),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://covelline.com'));
                  },
                  child: Text("© covelline, LLC. ${DateTime.now().year}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
