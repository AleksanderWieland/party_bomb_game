import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:party_bomb/pages/settings_page.dart';
import 'package:party_bomb/providers/flag_button_color_provider.dart';
import 'package:party_bomb/providers/language_provider.dart';
import 'ads/ad_helper.dart';
import 'pages/bomb_page.dart';
import 'pages/splash_screen.dart';
import 'pages/info_page.dart';
import 'providers/score_counter_provider.dart';
import 'providers/round_count_provider.dart';
import 'package:party_bomb/shared_pref/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScoreCounter()),
        ChangeNotifierProvider(create: (_) => RoundCounter()),
        ChangeNotifierProvider(create: (_) => SetLanguage()),
        ChangeNotifierProvider(create: (_) => GetFlagButtonColor()),
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
    AdHelper adHelper = AdHelper();
    if (kIsWeb) {
    } else {
      try {
        adHelper.initGoogleMobileAds();
      } catch (e) {
        print(e);
      }
    }
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            //web gets no animation
          },
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MySplashScreen(),
        '/bomb': (context) => const BombPage(),
        '/settings': (context) => const SettingsPage(),
        '/info': (context) => const InfoPage(),
      },
    );
  }
}
