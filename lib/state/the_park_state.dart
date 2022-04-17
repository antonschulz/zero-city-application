import 'package:flutter/material.dart';

class TheParkState with ChangeNotifier {
  late String parkingAnswer = "";

  void setText(String str) {
    parkingAnswer = str;

    notifyListeners();
  }

}
