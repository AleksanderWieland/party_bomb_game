import 'package:flutter/material.dart';

class RoundCounter with ChangeNotifier {
  int _round = 0;

  int get round => _round;

  void increment() {
    _round++;
    notifyListeners();
  }

  void reset() {
    _round = 0;
    notifyListeners();
  }
}
