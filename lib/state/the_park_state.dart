import 'package:flutter/material.dart';

class TheParkState with ChangeNotifier {
  late String parkingAnswer = "";
  bool completed = false;

  void setText(String str) {
    parkingAnswer = str;
    completed = true;
    notifyListeners();
  }
}
