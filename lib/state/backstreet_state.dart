import 'package:flutter/material.dart';

class BackstreetState with ChangeNotifier {
  List<String> year = ["1832", "1875", "1890", "1915", "1926"];

  List<String> object = [
    "Flygplanet Bleriot",
    "Cykeln Nordstjärnan",
    "Balansångmaskinen",
    "Ottomotorn",
    "T-Forden",
  ];

  void hej() {
    notifyListeners();
  }
}
