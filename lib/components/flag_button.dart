import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../const.dart';
import '../providers/language_provider.dart';

class LanguageFlagButton extends StatelessWidget {
  LanguageFlagButton(
      {required this.providerLanguage,
      required this.onPressed,
      required this.opacity,
      required this.image,
      required this.backgroundColor});
  void Function() onPressed;
  final SetLanguage providerLanguage;
  double opacity;
  Widget image;
  int backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: kFlagButtonStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(Color(backgroundColor))),
      child: SizedBox(
        width: flagImageHalfWidth,
        height: flagImageHalfHeight,
        child: SimpleShadow(
            color: Colors.black,
            opacity: 0.5,
            sigma: 5,
            offset: const Offset(5, 7),
            child: image),
      ),
    );
  }
}
