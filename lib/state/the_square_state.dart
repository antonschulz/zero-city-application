import 'package:flutter/material.dart';
import 'dart:async';

class TheSquareState with ChangeNotifier {
  //timer variables
  Timer? _timer;
  var start = 300; //timer should be five minutes (300 sec)
  var timerStarted = false;
  var timerFinished = false;

  //variables for button
  var color = Colors.grey;

  //start timer and count down
  void startTimer() {
    color = Colors.green;
    timerStarted = true;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          timerFinished = true;
        } else {
          start--;
        }
        notifyListeners();
      },
    );
  }

  //format seconds to MM:SS
  String formatTime(int seconds) {
    return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
  }

  //get time
  String getTime() {
    return formatTime(start);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
