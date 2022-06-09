import 'package:flutter/material.dart';
import 'package:zero_city/utils/Graphics.dart';

class MainStreetState with ChangeNotifier {
  late String kgClothesThrown = "";
  late Color color = Graphics.GREY;
  String correctAnswer = "11";
  bool isCorrectAnswer = false;
  bool displaySnackBar = false;

  bool canContinue = false;

  late List<String> smartThingsWithJeans = ["", "", ""];

  void setClothesThrown(String str) {
    kgClothesThrown = str;
    notifyListeners();
  }

  void submitClothesThrown(String str) {
    kgClothesThrown = str;
    isCorrectAnswer = str == correctAnswer;
    displaySnackBar = str != correctAnswer;

    color = isCorrectAnswer ? Graphics.GREEN : Graphics.GREY;

    notifyListeners();
  }

  void setSmartThingsWithJeans(int idx, String str) {
    if (str != "") {
      smartThingsWithJeans[idx] = str;
    }

    notifyListeners();
  }

  void submitSmartThingsWithJeans(int idx, String str) {
    setSmartThingsWithJeans(idx, str);

    for (int i = 0; i <= 2; i++) {
      if (smartThingsWithJeans[i] == "") {
        color = Graphics.GREY;
        canContinue = false;
        return;
      }
    }

    canContinue = true;
    color = Graphics.GREEN;
    notifyListeners();
  }

  void resetColor() {
    color = Graphics.GREY;
    notifyListeners();
  }
}
