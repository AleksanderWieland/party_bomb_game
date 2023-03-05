import 'package:flutter/material.dart';
import 'package:party_bomb/const.dart';

class LoadingWidgetReplacement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: kBoxDecorationStyle,
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: SizedBox(height: 40.0)));
  }
}
