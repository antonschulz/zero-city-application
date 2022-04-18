import 'package:flutter/material.dart';

class PlanningLabState with ChangeNotifier {
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

  // Count number of buttos pressed
  var count = 0;

  // Color for continue button
  Color color = Colors.grey;

  int group = 0;
  bool correct = false;

  String correctProcent = "123";
  String hint = "Skriv 123";

  String answer1b = "";

  void setGroup(int val) {
    group = val;
    notifyListeners();
  }

  void assign1b(String str) {
    // Assign the typed str to inputStr

    if (str != "") {
      correct = true;
      color = Colors.green;
      answer1b = str;
    } else {
      correct = false;
      color = Colors.grey;
    }

    notifyListeners();
  }

  void assing1c(String str) {
    // Assign the typed str to inputStr
    if (str == correctProcent) {
      correct = true;
      hint = correctProcent + " är rätt svar!";
      color = Colors.green;
    } else {
      hint = "Försök igen";
    }

    notifyListeners();
  }

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
        color = Colors.green;
      }
      // User can deselect an option
    } else if (clicked[index]) {
      clicked[index] = !clicked[index];
      answers.remove(strs[index].toString());
      count--;
      color = Colors.grey;
    }

    notifyListeners();
  }

  void resetContinueButton() {
    correct = false;
    color = Colors.grey;
  }
}
