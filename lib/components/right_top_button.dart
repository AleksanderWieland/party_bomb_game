import 'package:flutter/material.dart';
import 'package:party_bomb/const.dart';

class RightTopButton extends StatelessWidget {
  RightTopButton({required this.onPressed, required this.buttonIcon});

  final void Function() onPressed;
  final IconData buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: kCircularButtonStyle,
            child: Icon(
              buttonIcon,
              size: 40.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
