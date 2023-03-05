import 'package:flutter/material.dart';
import 'package:party_bomb/const.dart';
import 'package:party_bomb/text_lang.dart';
import 'package:party_bomb/shared_pref/shared_preferences.dart';
import 'package:party_bomb/words_list.dart';
import 'dart:math';

class SetLanguage extends ChangeNotifier {
  static List<String> getLanguageListFunction(
      var polish, var english, var german, var sweden) {
    String? defaultLanguage = UserPreferences.getDefaultLanguage();
    List<String> languageList;
    if (defaultLanguage == kPolishCode) {
      languageList = polish;
    } else if (defaultLanguage == kEnglishCode) {
      languageList = english;
    } else if (defaultLanguage == kGermanCode) {
      languageList = german;
    } else if (defaultLanguage == kSwedenCode) {
      languageList = sweden;
    } else {
      languageList = english;
    }
    return languageList;
  }

  List<String> _langList =
      getLanguageListFunction(kLangPL, kLangEN, kLangGE, kLangSE);
  List<String> _wordList =
      getLanguageListFunction(wordsPL, wordsEN, wordsGE, wordsSE);
  List<String> getLanguage() => _langList;
  List<String> getWords() => _wordList;

  static String _findRandomWordLanguage() {
    String? defaultLanguage = UserPreferences.getDefaultLanguage();
    String randomWord;
    if (defaultLanguage == kPolishCode) {
      randomWord = wordsPL[Random().nextInt(wordsPL.length)];
    } else if (defaultLanguage == kEnglishCode) {
      randomWord = wordsEN[Random().nextInt(wordsEN.length)];
    } else if (defaultLanguage == kGermanCode) {
      randomWord = wordsGE[Random().nextInt(wordsGE.length)];
    } else if (defaultLanguage == kSwedenCode) {
      randomWord = wordsSE[Random().nextInt(wordsSE.length)];
    } else {
      randomWord = wordsEN[Random().nextInt(wordsEN.length)];
    }
    return randomWord;
  }

  String _randomWord = _findRandomWordLanguage();
  String getRandomWord() => _randomWord;

  List<String> _usedWords = [];
  int _wordListLength = 0;
  bool _isDuplicate = false;

  static String _findRandomOptionLanguage() {
    String? defaultLanguage = UserPreferences.getDefaultLanguage();
    String randomWord;
    if (defaultLanguage == kPolishCode) {
      randomWord = kLangPL[20 + Random().nextInt(3)];
    } else if (defaultLanguage == kEnglishCode) {
      randomWord = kLangEN[20 + Random().nextInt(3)];
    } else if (defaultLanguage == kGermanCode) {
      randomWord = kLangGE[20 + Random().nextInt(3)];
    } else if (defaultLanguage == kSwedenCode) {
      randomWord = kLangSE[20 + Random().nextInt(3)];
    } else {
      randomWord = kLangEN[20 + Random().nextInt(3)];
    }
    return randomWord;
  }

  String _randomOption = _findRandomOptionLanguage();
  String getRandomOption() => _randomOption;

  setLangToPL() {
    _langList = kLangPL;
    _wordList = wordsPL;
    notifyListeners();
  }

  setLangToEN() {
    _langList = kLangEN;
    _wordList = wordsEN;
    notifyListeners();
  }

  setLangToGE() {
    _langList = kLangGE;
    _wordList = wordsGE;
    notifyListeners();
  }

  setLangToSE() {
    _langList = kLangSE;
    _wordList = wordsSE;
    notifyListeners();
  }

  saveDuplicates() {
    _usedWords.add(_randomWord);
    if (UserPreferences.getDefaultLanguage() == kPolishCode) {
      _wordListLength = wordsPL.length;
    } else if (UserPreferences.getDefaultLanguage() == kGermanCode) {
      _wordListLength = wordsGE.length;
    } else if (UserPreferences.getDefaultLanguage() == kEnglishCode) {
      _wordListLength = wordsEN.length;
    } else if (UserPreferences.getDefaultLanguage() == kSwedenCode) {
      _wordListLength = wordsSE.length;
    }
    if (_usedWords.length == _wordListLength) {
      resetDuplicates();
    }
  }

  resetDuplicates() {
    _usedWords = [];
  }

  randomWord() {
    do {
      int randomNumber = Random().nextInt(_wordList.length);
      for (String i in _usedWords) {
        if (_wordList[randomNumber] == i) {
          _isDuplicate = true;
          break;
        } else {
          _isDuplicate = false;
        }
      }
      if (_isDuplicate == false) {
        _randomWord = _wordList[randomNumber];
      }
    } while (_isDuplicate == true);

    notifyListeners();
  }

  randomOption() {
    switch (Random().nextInt(3)) {
      case 0:
        {
          _randomOption = _langList[20];
          break;
        }
      case 1:
        {
          _randomOption = _langList[21];
          break;
        }
      default:
        {
          _randomOption = _langList[22];
          break;
        }
    }
    notifyListeners();
  }
}
