import 'package:party_bomb/const.dart';
import 'package:flutter/material.dart';

class ScoreCounter with ChangeNotifier {
  final List<int> _scoreList = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  List<int> get scoreList => _scoreList;

  void increment(int indexNumber) {
    _scoreList[indexNumber]++;
    notifyListeners();
  }

  void decrement(int indexNumber) {
    _scoreList[indexNumber]--;
    notifyListeners();
  }

  void reset() {
    _scoreList.clear();
    _scoreList.addAll(kScoreList);
    notifyListeners();
  }
}
