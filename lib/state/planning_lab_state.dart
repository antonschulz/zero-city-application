import 'package:flutter/material.dart';
import 'package:zero_city/utils/Graphics.dart';

class PlanningLabState with ChangeNotifier {
  // PlanningLab1
  final List<String> strs = [
    "Egen bil som drivs med fossila bränslen",
    "Att köpa nya kläder",
    "Att äta kött",
    "En ny smartphone",
    "En ny dator",
    "Flygresor",
    "Nya möbler",
    "Sociala medier",
    "Nytt tv-spel",
    "Julklappar",
    "Stort boende",
    "Husdjur, som katt eller hund",
    "Att äga en egen bil",
    "Varma bostäder (max 19 grader)",
    "Shoppinggallerior",
    "Swimmingpool",
    "E-handel",
    "Eget rum",
    "Fotbollsplaner med konstgräs",
    "Mat och godis som innehåller palmolja",
    "Snabbmat",
    "Sommarstuga",
    "Avokado och exotiska frukter",
    "Bubbelvatten och sportdrycker",
  ];

  // List to keep answers
  List<String> answers = [];

  // Corresponding list of booleans to keep track if the button is clicked
  List<bool> clicked = List.filled(24, false);

  // Count number of buttons pressed
  var count = 0;

  // Color for continue button
  Color color = Graphics.GREY;

  void onClick(int index) {
    // If clicked is false <=> button isn't currently pressed
    // Now set clicked to true and increment _counter
    // If 5 options are already picked: do nothing
    if (!clicked[index] && count < 5) {
      clicked[index] = !clicked[index];
      answers.add(strs[index]);
      count++;
      if (count == 5) {
        // Sets continue button colour for UI help
        color = Graphics.GREEN;
        correct = true;
      }
      // User can deselect an option
    } else if (clicked[index]) {
      clicked[index] = !clicked[index];
      answers.remove(strs[index].toString());
      count--;
      color = Graphics.GREY;
    }

    notifyListeners();
  }

  // PlanningLab2
  int group = 0;
  bool correct = false;
  String answer2 = "";

  void assign2(String str) {
    // Assign the typed str to inputStr

    if (str != "") {
      correct = true;
      color = Graphics.GREEN;
      answer2 = str;
    } else {
      correct = false;
      color = Graphics.GREY;
    }

    notifyListeners();
  }

  void setGroup(int val) {
    group = val;
    notifyListeners();
  }

  // PlanningLab3
  String correctProcent = "95";
  bool displaySnackBar = false;

  void submit3(String str) {
    // Assign the typed str to inputStr
    if (str == correctProcent) {
      correct = true;
      color = Graphics.GREEN;
    } else {
      displaySnackBar = true;
    }

    notifyListeners();
  }

  void resetContinueButton() {
    correct = false;
    color = Graphics.GREY;
  }
}
