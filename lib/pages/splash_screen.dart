import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../providers/language_provider.dart';
import 'bomb_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../const.dart';
import 'package:party_bomb/shared_pref/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    if (UserPreferences.getLanguageChange() == null) {
      UserPreferences.saveDefaultLanguage();
    } else {
      SetLanguage setLanguage = SetLanguage();
      if (UserPreferences.getDefaultLanguage() == kPolishCode) {
        setLanguage.setLangToPL;
      } else if (UserPreferences.getDefaultLanguage() == kGermanCode) {
        setLanguage.setLangToGE;
      } else if (UserPreferences.getDefaultLanguage() == kEnglishCode) {
        setLanguage.setLangToEN;
      } else if (UserPreferences.getDefaultLanguage() == kSwedenCode) {
        setLanguage.setLangToSE;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        animationDuration: const Duration(milliseconds: 800),
        splash: Center(
          child: Hero(
            tag: kHeroTag,
            child: const FaIcon(
              FontAwesomeIcons.bomb,
              color: Colors.black,
              size: 70.0,
            ),
          ),
        ),
        nextScreen: const BombPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        duration: 1000,
        splashIconSize: double.infinity,
      ),
    );
  }
}
