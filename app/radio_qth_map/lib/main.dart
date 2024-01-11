import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/main_router.dart';
import 'package:radio_qth_map/repository/firestore_repository.dart';
import 'package:radio_qth_map/repository/locale_notifier.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:radio_qth_map/firebase_options/dev.dart' as dev;
import 'package:radio_qth_map/firebase_options/prod.dart' as prod;
import 'package:intl/intl_browser.dart';

void main() async {
  usePathUrlStrategy();
  await findSystemLocale();
  await dotenv.load(fileName: 'key.env');
  if (dotenv.maybeGet('ENVIRONMENT') == 'prod') {
    await Firebase.initializeApp(
      options: prod.firebaseOptions,
    );
  } else {
    await Firebase.initializeApp(
      options: dev.firebaseOptions,
    );
  }
  final firestore = FirebaseFirestore.instance;
  if (dotenv.maybeGet('USE_FIRESTORE_EMULATOR') == 'true') {
    firestore.useFirestoreEmulator('localhost', 8080);
  }
  final Locale defaultLocale;
  if (Intl.getCurrentLocale().startsWith('ja')) {
    defaultLocale = const Locale("ja", "JP");
  } else {
    defaultLocale = const Locale("en");
  }
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => FirestoreRepository(firestore: firestore),
        ),
        ChangeNotifierProvider(create: (_) => LocaleNotifier(defaultLocale)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localeNotifier = context.watch<LocaleNotifier>();
    return MaterialApp.router(
      title: 'QTH map',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeNotifier.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff24c5be)),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerConfig: router,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          ],
        );
      },
    );
  }
}
