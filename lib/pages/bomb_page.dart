import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:party_bomb/components/right_top_button.dart';
import 'package:party_bomb/components/players_button_and_reset.dart';
import 'package:party_bomb/pages/settings_page.dart';
import 'package:party_bomb/shared_pref/shared_preferences.dart';
import 'package:party_bomb/providers/round_count_provider.dart';
import '../const.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import '../components/loading_widget.dart';
import '../components/loading_widget_replacement.dart';
import '../components/screen_transitions.dart';
import 'info_page.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:party_bomb/providers/language_provider.dart';
import 'package:party_bomb/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wakelock/wakelock.dart';

class BombPage extends StatefulWidget {
  const BombPage({Key? key}) : super(key: key);
  @override
  State<BombPage> createState() => _BombPageState();
}

class _BombPageState extends State<BombPage> {
  bool isLoadingNeeded = false;
  Color currentStateOfButtonColor = kNotPressedColor;
  final tickingPlayer = AudioPlayer();
  final explosionPlayer = AudioPlayer();
  Timer? tickingTimer;
  Timer? explosionTimer;
  int minSeconds = kDefaultMinSeconds.toInt();
  int maxSeconds = kDefaultMaxSeconds.toInt();
  int playersNumber = 2;
  int returnRandom() {
    return (Random().nextInt(maxSeconds - minSeconds) + minSeconds);
  }

  AdHelper adHelper = AdHelper();

  @override
  void initState() {
    Wakelock.enable();
    playersNumber = UserPreferences.loadPlayersNumber();
    maxSeconds = UserPreferences.loadMaxValue().toInt();
    minSeconds = UserPreferences.loadMinValue().toInt();

    //proszenie o zgody
    final paramsAboutUserConsentInfo = ConsentRequestParameters();
    ConsentInformation.instance.requestConsentInfoUpdate(
      paramsAboutUserConsentInfo,
      () async {
        if (await ConsentInformation.instance.isConsentFormAvailable()) {
          adHelper.loadPersonalGoogleAdsConsentForm();
        }
      },
      (FormError error) {
        throw (error);
      },
    );

    if (kIsWeb) {
    } else {
      setState(() {
        adHelper.loadBannerAd();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    if (kIsWeb) {
    } else {
      adHelper.bannerAdDispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    var providerLanguage = Provider.of<SetLanguage>(context);
    List<Widget> playersButtons =
        PlayersWidgetListWidget(playersNumber: playersNumber)
            .playersWidgetList();
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 90.0,
                decoration: kBoxDecorationStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: isLoadingNeeded
                              ? LoadingWidget()
                              : LoadingWidgetReplacement(),
                        ),
                        Expanded(
                          child: Text(
                            '${providerLanguage.getLanguage()[23]} ${context.watch<RoundCounter>().round}',
                            style: kTextStyle.copyWith(fontSize: 30.0),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            decoration: kBoxDecorationStyle,
                            child: AutoSizeText(
                              providerLanguage.getRandomWord(),
                              textAlign: TextAlign.center,
                              style: kTextStyle.copyWith(fontSize: 70.0),
                              maxLines: 1,
                              stepGranularity: 3,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topCenter,
                            decoration: kBoxDecorationStyle,
                            padding: const EdgeInsets.only(top: 3.0),
                            child: AutoSizeText(
                              providerLanguage.getRandomOption(),
                              textAlign: TextAlign.center,
                              style: kTextStyle.copyWith(fontSize: 20.0),
                              maxLines: 1,
                              stepGranularity: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: kBoxDecorationStyle,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextButton(
                      onPressed: () async {
                        explosionPlayer.stop();
                        if (currentStateOfButtonColor == kNotPressedColor) {
                          providerLanguage.randomWord();
                          providerLanguage.randomOption();
                          providerLanguage.saveDuplicates();
                          //jeśli robimy coś z context to musi to być przed pierwszym await.
                          final currentGameRounds =
                              context.read<RoundCounter>();
                          await tickingPlayer.play(AssetSource(
                              'sounds/wall-clock-ticks-quartz-clock-25480.mp3'));
                          tickingPlayer.setReleaseMode(ReleaseMode.loop);
                          setState(() {
                            currentStateOfButtonColor = kPressedColor;
                            isLoadingNeeded = true;
                          });
                          //odliczanie do losowej liczby
                          tickingTimer = Timer(
                            Duration(seconds: returnRandom()),
                            () async {
                              setState(
                                () {
                                  currentStateOfButtonColor = kNotPressedColor;
                                  isLoadingNeeded = false;
                                },
                              );
                              tickingPlayer.stop();
                              await explosionPlayer.play(
                                AssetSource('sounds/explosion-6801.mp3'),
                              );
                              tickingTimer!.cancel();
                              currentGameRounds.increment();
                              explosionTimer = Timer(
                                const Duration(seconds: 7),
                                () async {
                                  explosionPlayer.stop();
                                },
                              );
                            },
                          );
                        } else {
                          tickingTimer != null ? tickingTimer!.cancel() : null;
                          tickingPlayer.stop();
                          explosionPlayer.stop();
                          setState(
                            () {
                              currentStateOfButtonColor = kNotPressedColor;
                              isLoadingNeeded = false;
                            },
                          );
                        }
                      },
                      style: kCircularButtonStyle.copyWith(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: MaterialStateProperty.all(
                              currentStateOfButtonColor),
                          fixedSize: MaterialStateProperty.all(
                              const Size(270.0, 270.0))),
                      child: Hero(
                        tag: kHeroTag,
                        child: const FaIcon(
                          FontAwesomeIcons.bomb,
                          color: Colors.black,
                          size: 80.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 20.0),
                  alignment: Alignment.center,
                  decoration: kBoxDecorationStyle,
                  child: Wrap(
                    runSpacing: 5,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      ...playersButtons,
                    ],
                  ),
                ),
              ),
              if (adHelper.getBannerAd != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: kIsWeb
                        ? Container()
                        : Container(
                            width: adHelper.getBannerAd!.size.width.toDouble(),
                            height:
                                adHelper.getBannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: adHelper.getBannerAd!)),
                  ),
                )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RightTopButton(
                  onPressed: () async {
                    //animacja
                    await Navigator.push(
                      context,
                      kIsWeb
                          ? MyCustomRouteForWeb(
                              builder: (context) => const InfoPage())
                          : MyCustomRouteForAndroid(
                              builder: (context) => const InfoPage()),
                    );
                  },
                  buttonIcon: Icons.info_outline_rounded),
              RightTopButton(
                  onPressed: () async {
                    dynamic response = await Navigator.push(
                      context,
                      kIsWeb
                          ? MyCustomRouteForWeb(
                              builder: (context) => const SettingsPage())
                          : MyCustomRouteForAndroid(
                              builder: (context) => const SettingsPage()),
                    );
                    if (response != null) {
                      setState(() {
                        minSeconds = response[0].toInt();
                        maxSeconds = response[1].toInt();
                        playersNumber = response[2];
                      });
                    }
                  },
                  buttonIcon: Icons.settings)
            ],
          ),
        ],
      ),
    );
  }
}
