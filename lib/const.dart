import 'package:flutter/material.dart';

//colors of the big button with a bomb icon - bomb screen
Color kNotPressedColor = Colors.white;
Color kPressedColor = Colors.grey;

//default min max seconds - slider
double kDefaultMinSeconds = 10;
double kDefaultMaxSeconds = 60;

//default players number
int kDefaultPlayersNumber = 2;

//slider min max values
double kRangeSliderMin = 10;
double kRangeSliderMax = 120;
//slider theme
SliderThemeData kSettingsSliderThemeData = const SliderThemeData(
    inactiveTrackColor: Colors.grey,
    thumbColor: Colors.black,
    inactiveTickMarkColor: Colors.white,
    showValueIndicator: ShowValueIndicator.always,
    activeTrackColor: Colors.black,
    overlayColor: Color(0x33525252));

TextStyle kNormalInfoTextStyle = const TextStyle(
    fontSize: 25.0, color: Colors.grey, decoration: TextDecoration.none);

//buttons that are on the bottom of settings screen
double kSizedBoxTextButtonWidth = 200.0;
double kSizedBoxTextButtonHeight = 50.0;
TextStyle kTextStyle = const TextStyle(
    fontSize: 40.0, color: Colors.grey, decoration: TextDecoration.none);
ButtonStyle kSettingsButtonStyle = ButtonStyle(
  overlayColor: MaterialStateProperty.all(const Color(0xD0E7E7E7)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: const BorderSide(color: Colors.grey))),
);

ButtonStyle kFlagButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(const Color(0xD0E7E7E7)),
  overlayColor: MaterialStateProperty.all(const Color(0xD0E7E7E7)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.grey))),
);

//circular buttons style
ButtonStyle kCircularButtonStyle = ButtonStyle(
  overlayColor: MaterialStateProperty.all(const Color(0xD0E7E7E7)),
  shape: MaterialStateProperty.all(const CircleBorder()),
  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
  shadowColor: MaterialStateProperty.all(Colors.black),
  elevation: MaterialStateProperty.all(7.0),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  fixedSize: MaterialStateProperty.all(const Size(50.0, 50.0)),
);

//hero animation tag
String kHeroTag = 'splash';

//box decoration style
BoxDecoration kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    width: 0,
    color: Colors.white, //the one you prefer
  ),
);

//Color list for players' score buttons
List<Color> kPlayersButtonColors = [
  Colors.amber,
  Colors.blue,
  Colors.brown,
  Colors.red,
  Colors.deepPurpleAccent,
  Colors.green,
  Colors.yellowAccent,
  Colors.blueGrey,
  Colors.lightGreen,
  Colors.purpleAccent,
  Colors.greenAccent,
  Colors.black
];

List<int> kScoreList = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

Size kBottomPlayersAndResetButtonsSize = const Size(55.0, 55.0);

TextStyle kTextInfoNormalStyle = const TextStyle(
    fontSize: 25.0, color: Colors.grey, decoration: TextDecoration.none);

TextStyle kTextInfoBigStyle = const TextStyle(
    fontSize: 35.0,
    color: Colors.grey,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold);

String kPolishCode = 'pl';
String kEnglishCode = 'en';
String kGermanCode = 'de';
String kSwedenCode = 'sv';

double flagImageHalfWidth = 68.0;
double flagImageHalfHeight = 64.0;
