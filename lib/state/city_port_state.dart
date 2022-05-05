import 'package:flutter/material.dart';

class CityPortState with ChangeNotifier {
  late String text;
  late Color color = Colors.grey;
  late bool enteredText;

  int group = 0;

  final List<String> alternatives = [
    "Inför en lag som gör att man bara får lämna tillbaka fem produkter per år.",
    "Köp färre saker online - så vi inte behöver returnera så mycket!",
    "Köp lokalt, så att du kan returnera genom att besöka butiken själv.",
  ];

  void setText(String str) {
    text = str;

    notifyListeners();
  }

  void setEnteredText() {
    enteredText = true;
    if (text != "") {
      color = Colors.green;
    }
    notifyListeners();
  }

  void selectAlternative(int idx) {
    group = idx;
    notifyListeners();
  }
}
