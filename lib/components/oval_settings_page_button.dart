import 'package:flutter/material.dart';
import 'package:party_bomb/const.dart';

class OvalButtons extends StatelessWidget {
  OvalButtons({required this.onPressed, required this.buttonText});

  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: kSizedBoxTextButtonWidth,
        height: kSizedBoxTextButtonHeight,
        child: TextButton(
            onPressed: onPressed,
            style: kSettingsButtonStyle,
            child: Text(
              buttonText,
              style: kTextStyle.copyWith(fontSize: 20.0),
              textAlign: TextAlign.center,
            )));
  }
}
