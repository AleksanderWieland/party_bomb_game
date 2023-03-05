import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart';
import '../const.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

//check if app should look for default language on the device
// if user changed the language on settings page, it shouldn't look for system language
  static Future saveLanguageChange() => _preferences.setBool('change', true);

  static bool? getLanguageChange() => _preferences.getBool('change');

  static Future saveDefaultLanguage() async {
    if (Platform.localeName.contains('pl')) {
      _preferences.setString('language', kPolishCode);
    } else if (Platform.localeName.contains('en')) {
      _preferences.setString('language', kEnglishCode);
    } else if (Platform.localeName.contains('de')) {
      _preferences.setString('language', kGermanCode);
    } else if (Platform.localeName.contains('sv')) {
      _preferences.setString('language', kSwedenCode);
    } else {
      _preferences.setString('language', kEnglishCode);
    }
  }

  static Future saveLanguage(String language) async =>
      _preferences.setString('language', language);

  static String? getDefaultLanguage() => _preferences.getString('language');

  static double loadMinValue() =>
      _preferences.getDouble('min') ?? kDefaultMinSeconds;

  static double loadMaxValue() =>
      _preferences.getDouble('max') ?? kDefaultMaxSeconds;

  static int loadPlayersNumber() =>
      _preferences.getInt('playersNumber') ?? kDefaultPlayersNumber;

  static Future saveMax(double x) => _preferences.setDouble('max', x);

  static Future saveMin(double x) => _preferences.setDouble('min', x);

  static Future savePlayersNumber(int x) =>
      _preferences.setInt('playersNumber', x);
}
