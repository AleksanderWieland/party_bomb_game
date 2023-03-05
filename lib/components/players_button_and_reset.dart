import 'package:flutter/material.dart';
import 'package:party_bomb/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:party_bomb/providers/round_count_provider.dart';
import 'package:party_bomb/providers/score_counter_provider.dart';
import 'package:party_bomb/ads/ad_helper.dart';
import '../providers/language_provider.dart';
import 'package:flutter/foundation.dart';

class PlayersButton extends StatefulWidget {
  PlayersButton({
    Key? key,
    required this.colorListValue,
    required this.indexNumber,
  }) : super(key: key);

  final Color colorListValue;
  final int indexNumber;
  int score = 0;

  @override
  State<PlayersButton> createState() => _PlayersButtonState();
}

class _PlayersButtonState extends State<PlayersButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: TextButton(
        style: kCircularButtonStyle.copyWith(
            fixedSize:
                MaterialStateProperty.all(kBottomPlayersAndResetButtonsSize),
            backgroundColor: MaterialStateProperty.all(
                kPlayersButtonColors[widget.indexNumber])),
        onPressed: () {
          Feedback.forTap(context);
          return context.read<ScoreCounter>().increment(widget.indexNumber);
        },
        onLongPress: () {
          Feedback.forTap(context);
          if (context.read<ScoreCounter>().scoreList[widget.indexNumber] > 0) {
            return context.read<ScoreCounter>().decrement(widget.indexNumber);
          }
        },
        child: Center(
          child: Stack(
            children: [
              Text(
                context
                    .watch<ScoreCounter>()
                    .scoreList[widget.indexNumber]
                    .toStringAsFixed(0),
                style: kTextStyle.copyWith(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.white70,
                ),
              ),
              Text(
                  context
                      .watch<ScoreCounter>()
                      .scoreList[widget.indexNumber]
                      .toStringAsFixed(0),
                  style: kTextStyle)
            ],
          ),
        ),
      ),
    );
  }
}

class ResetResultButton extends StatefulWidget {
  ResetResultButton({this.function});
  Function? function;

  @override
  State<ResetResultButton> createState() => _ResetResultButtonState();
}

class _ResetResultButtonState extends State<ResetResultButton> {
  AdHelper adHelper = AdHelper();
  @override
  void dispose() {
    adHelper.getInterstitialAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    adHelper.loadInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: TextButton(
        style: kCircularButtonStyle.copyWith(
            fixedSize:
                MaterialStateProperty.all(kBottomPlayersAndResetButtonsSize)),
        onPressed: () {
          showDialog<String>(
              context: context,
              //AlertDialog before resetting scoreboard and round number
              builder: (BuildContext context) => buildAlertDialog(context));
          Feedback.forTap(context);
        },
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.trash,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    var providerLanguage = Provider.of<SetLanguage>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      buttonPadding: const EdgeInsets.only(right: 20.0),
      title: Text(
          'Czy na pewno chcesz wyzerować tabelę wyników i licznik rund?',
          style: kTextStyle.copyWith(fontSize: 20.0)),
      actions: <Widget>[
        TextButton(
            style: kSettingsButtonStyle,
            onPressed: () => Navigator.pop(context, 'Nie'),
            child: Text(
              'Nie',
              style: kTextStyle.copyWith(fontSize: 20.0),
            )),
        TextButton(
            style: kSettingsButtonStyle,
            onPressed: () {
              context.read<RoundCounter>().reset();
              context.read<ScoreCounter>().reset();
              providerLanguage.resetDuplicates();
              if (kIsWeb) {
              } else {
                adHelper.getInterstitialAd;
                adHelper.getInterstitialAd?.show();
              }
              Navigator.pop(context, 'Tak');
            },
            child: Text(
              'Tak',
              style: kTextStyle.copyWith(fontSize: 20.0, color: Colors.black),
            )),
      ],
    );
  }
}

class PlayersWidgetListWidget {
  PlayersWidgetListWidget({required this.playersNumber});

  int playersNumber;

  List<Widget> playersWidgetList() {
    List<Widget> list = [];
    for (int i = 0; i < playersNumber; i++) {
      list.add(
        PlayersButton(
          colorListValue: kPlayersButtonColors[i],
          indexNumber: i,
        ),
      );
    }
    list.add(ResetResultButton());
    return list;
  }
}
