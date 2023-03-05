import 'package:flutter/material.dart';
import '../components/flag_button.dart';
import '../components/image_placeholder_web.dart';
import '../const.dart';
import 'package:party_bomb/components/oval_settings_page_button.dart';
import '../components/right_top_button.dart';
import 'package:party_bomb/shared_pref/shared_preferences.dart';
import 'package:party_bomb/providers/language_provider.dart';
import 'package:provider/provider.dart';
import '../providers/flag_button_color_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _minValue = kDefaultMinSeconds;
  double _maxValue = kDefaultMaxSeconds;
  int playersNumber = kDefaultPlayersNumber;
  RangeValues _currentRangeValues =
      RangeValues(kDefaultMinSeconds, kDefaultMaxSeconds);

  @override
  void initState() {
    super.initState();
    _minValue = UserPreferences.loadMinValue();
    _maxValue = UserPreferences.loadMaxValue();
    playersNumber = UserPreferences.loadPlayersNumber();
    _currentRangeValues = RangeValues(_minValue, _maxValue);
  }

  @override
  Widget build(BuildContext context) {
    var providerLanguage = Provider.of<SetLanguage>(context);
    var providerFlagButton = Provider.of<GetFlagButtonColor>(context);
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        providerLanguage.getLanguage()[0],
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(fontSize: 30.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 4.0,
                          runSpacing: 4.0,
                          runAlignment: WrapAlignment.center,
                          children: [
                            LanguageFlagButton(
                              providerLanguage: providerLanguage,
                              onPressed: () {
                                UserPreferences.saveLanguage(kEnglishCode);
                                providerLanguage.resetDuplicates();
                                providerLanguage.setLangToEN();
                                providerLanguage.randomWord();
                                providerLanguage.randomOption();
                                providerFlagButton.updateColors();
                                UserPreferences.saveLanguageChange();
                              },
                              image: ImageWidgetPlaceholder(
                                imageDir: 'assets/images/gb_android.png',
                                placeholder: SizedBox(
                                    width: flagImageHalfWidth,
                                    height: flagImageHalfHeight),
                              ),
                              opacity: 0.6,
                              backgroundColor: providerFlagButton.gbColor,
                            ),
                            LanguageFlagButton(
                              providerLanguage: providerLanguage,
                              onPressed: () {
                                UserPreferences.saveLanguage(kGermanCode);
                                providerLanguage.resetDuplicates();
                                providerLanguage.setLangToGE();
                                providerLanguage.randomWord();
                                providerLanguage.randomOption();
                                providerFlagButton.updateColors();
                                UserPreferences.saveLanguageChange();
                              },
                              image: ImageWidgetPlaceholder(
                                imageDir: 'assets/images/flag-ge_android.png',
                                placeholder: SizedBox(
                                    width: flagImageHalfWidth,
                                    height: flagImageHalfHeight),
                              ),
                              opacity: 0.6,
                              backgroundColor: providerFlagButton.geColor,
                            ),
                            LanguageFlagButton(
                                providerLanguage: providerLanguage,
                                onPressed: () {
                                  UserPreferences.saveLanguage(kPolishCode);
                                  providerLanguage.resetDuplicates();
                                  providerLanguage.setLangToPL();
                                  providerLanguage.randomWord();
                                  providerLanguage.randomOption();
                                  providerFlagButton.updateColors();
                                  UserPreferences.saveLanguageChange();
                                },
                                image: ImageWidgetPlaceholder(
                                  imageDir: 'assets/images/flag-pl_android.png',
                                  placeholder: SizedBox(
                                      width: flagImageHalfWidth,
                                      height: flagImageHalfHeight),
                                ),
                                opacity: 0.6,
                                backgroundColor: providerFlagButton.plColor),
                            LanguageFlagButton(
                                providerLanguage: providerLanguage,
                                onPressed: () {
                                  UserPreferences.saveLanguage(kSwedenCode);
                                  providerLanguage.resetDuplicates();
                                  providerLanguage.setLangToSE();
                                  providerLanguage.randomWord();
                                  providerLanguage.randomOption();
                                  providerFlagButton.updateColors();
                                  UserPreferences.saveLanguageChange();
                                },
                                image: ImageWidgetPlaceholder(
                                  imageDir: 'assets/images/flag-se_android.png',
                                  placeholder: SizedBox(
                                      width: flagImageHalfWidth,
                                      height: flagImageHalfHeight),
                                ),
                                opacity: 0.6,
                                backgroundColor: providerFlagButton.seColor),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          providerLanguage.getLanguage()[1],
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(fontSize: 30.0),
                        ),
                      ),
                      Material(
                        child: Container(
                          color: Colors.white,
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: SliderTheme(
                            data: kSettingsSliderThemeData,
                            child: RangeSlider(
                              min: kRangeSliderMin,
                              max: kRangeSliderMax,
                              divisions: 11,
                              labels: RangeLabels(
                                _currentRangeValues.start.round().toString(),
                                _currentRangeValues.end.round().toString(),
                              ),
                              values: _currentRangeValues,
                              onChanged: (RangeValues values) {
                                setState(() {
                                  if (values.start != values.end) {
                                    _currentRangeValues = values;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (_currentRangeValues.start).toStringAsFixed(0),
                              style: kTextStyle,
                            ),
                            Text(
                              (_currentRangeValues.end).toStringAsFixed(0),
                              style: kTextStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(children: [
                        OvalButtons(
                            onPressed: () {
                              setState(() {
                                _currentRangeValues = RangeValues(
                                    kDefaultMinSeconds, kDefaultMaxSeconds);
                              });
                            },
                            buttonText: providerLanguage.getLanguage()[2]),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            providerLanguage.getLanguage()[3],
                            style: kTextStyle.copyWith(fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RightTopButton(
                                  onPressed: () {
                                    if (playersNumber > 2) {
                                      setState(
                                        () {
                                          playersNumber--;
                                        },
                                      );
                                    }
                                  },
                                  buttonIcon: Icons.remove),
                              Text(
                                playersNumber.toStringAsFixed(0),
                                style: kTextStyle.copyWith(color: Colors.black),
                              ),
                              RightTopButton(
                                  onPressed: () {
                                    if (playersNumber < 12) {
                                      setState(() {
                                        playersNumber++;
                                      });
                                    }
                                  },
                                  buttonIcon: Icons.add)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: OvalButtons(
                              onPressed: () {
                                setState(() {
                                  UserPreferences.saveMin(
                                      _currentRangeValues.start);
                                  _minValue = UserPreferences.loadMinValue();
                                  UserPreferences.saveMax(
                                      _currentRangeValues.end);
                                  _maxValue = UserPreferences.loadMaxValue();
                                  UserPreferences.savePlayersNumber(
                                      playersNumber);
                                  playersNumber =
                                      UserPreferences.loadPlayersNumber();
                                  Navigator.pop(context, [
                                    _currentRangeValues.start,
                                    _currentRangeValues.end,
                                    playersNumber
                                  ]);
                                });
                              },
                              buttonText: providerLanguage.getLanguage()[4]),
                        ),
                      ])
                    ],
                  ),
                ),
              ],
            ),
            RightTopButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                buttonIcon: Icons.close),
          ],
        ),
      ),
    );
  }
}
