import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../const.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: kBoxDecorationStyle,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: SizedBox(
                height: 40.0,
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 30.0,
                ),
              )),
        ));
  }
}
