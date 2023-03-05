import 'package:flutter/material.dart';
import 'package:party_bomb/shared_pref/shared_preferences.dart';

import '../const.dart';

class GetFlagButtonColor extends ChangeNotifier {
  static const int _darkColor = 0xD0E7E7E7;
  static const int _whiteColor = 0xFFFFFFFF;

  int plColor = UserPreferences.getDefaultLanguage() == kPolishCode
      ? _darkColor
      : _whiteColor;
  int gbColor = UserPreferences.getDefaultLanguage() == kEnglishCode
      ? _darkColor
      : _whiteColor;
  int geColor = UserPreferences.getDefaultLanguage() == kGermanCode
      ? _darkColor
      : _whiteColor;
  int seColor = UserPreferences.getDefaultLanguage() == kSwedenCode
      ? _darkColor
      : _whiteColor;

  void updateColors() {
    plColor = UserPreferences.getDefaultLanguage() == kPolishCode
        ? _darkColor
        : _whiteColor;
    gbColor = UserPreferences.getDefaultLanguage() == kEnglishCode
        ? _darkColor
        : _whiteColor;
    geColor = UserPreferences.getDefaultLanguage() == kGermanCode
        ? _darkColor
        : _whiteColor;
    seColor = UserPreferences.getDefaultLanguage() == kSwedenCode
        ? _darkColor
        : _whiteColor;
    notifyListeners();
  }
}
