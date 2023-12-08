import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/repository/locale_notifier.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroduceScreen extends StatelessWidget {
  const IntroduceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 800,
            title: const Text('QTH map'),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: SizedBox(
                height: 800,
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
                onPressed: () {},
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
              )
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
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
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
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          leading: const Icon(
                            Icons.menu_book,
                            weight: 1.0,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!
                                .introduce_for_logging_title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          subtitle: Text(
                            AppLocalizations.of(context)!.introduce_for_logging,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          isThreeLine: true,
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
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          leading: const Icon(
                            Icons.map,
                            weight: 1.0,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!
                                .introduce_for_mapping_title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          subtitle: Text(
                            AppLocalizations.of(context)!.introduce_for_mapping,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          isThreeLine: true,
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
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          leading: const Icon(
                            Icons.switch_access_shortcut,
                            weight: 1.0,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!
                                .introduce_for_experience_title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          subtitle: Text(
                            AppLocalizations.of(context)!
                                .introduce_for_experience,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          isThreeLine: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          )
        ],
      ),
    );
  }
}
