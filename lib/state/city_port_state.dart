import 'package:flutter/material.dart';
import 'dart:async';
import 'package:zero_city/utils/Graphics.dart';

class CityPortState with ChangeNotifier {
  // Button color
  late Color color = Colors.grey;
  // Can continue to next mission bool
  var canContinue = false;

  // Timer widget
  Timer? _timer;
  var _count = 0; // Timer should start at 0 and count up
  var timerOn = false;

  // CityPort1
  // Start timer and count up
  late String timeTaken = "";

  void startTimer() {
    timerOn = true;
    canContinue = false;
    color = Graphics.GREY;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_count == 300) {
          timer.cancel();
          timerOn = false;
          canContinue = true;
          color = Graphics.GREY;
        } else {
          _count++;
        }
        notifyListeners();
      },
    );
  }

  void stopTimer() {
    canContinue = true;
    timerOn = false;
    color = Graphics.GREEN;
    timeTaken = getTime();
    _timer?.cancel();

    notifyListeners();
  }

  //format seconds to MM:SS
  String formatTime(int seconds) {
    return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
  }

  //get time
  String getTime() {
    return formatTime(_count);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // CityPort2
  int group = 0;

  // TODO init to "" but need to rewrite city_port2
  String answer2 =
      "Inför en lag som gör att man bara får lämna tillbaka fem produkter per år.";

  final List<String> alternatives = [
    "Inför en lag som gör att man bara får lämna tillbaka fem produkter per år.",
    "Köp färre saker online - så vi inte behöver returnera så mycket!",
    "Köp lokalt, så att du kan returnera genom att besöka butiken själv.",
  ];

  void selectAlternative(int idx) {
    group = idx;
    answer2 = alternatives[idx];
    notifyListeners();
  }
}
