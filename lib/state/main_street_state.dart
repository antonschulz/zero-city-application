import 'package:flutter/material.dart';

class MainStreetState with ChangeNotifier {
  late String kgClothesThrown = "";
  late Color color = Colors.grey;
  String correctAnswer = "123";
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

    color = isCorrectAnswer ? Colors.green : Colors.grey;

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
        color = Colors.grey;
        canContinue = false;
        return;
      }
    }

    canContinue = true;
    color = Colors.green;
    notifyListeners();
  }

  void resetColor() {
    color = Colors.grey;
    notifyListeners();
  }
}
