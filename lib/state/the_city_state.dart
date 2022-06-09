import 'package:flutter/material.dart';
import 'package:zero_city/utils/Graphics.dart';

// State that keeps track of all answers related to The City
class TheCityState with ChangeNotifier {
  late Color color = Graphics.GREY;
  bool canContinue = false;

  // The user input from TheCity1 is stored here
  // Initiated as empty strings
  late List<String> importantElements = [
    "",
    "",
    "",
    "",
    "",
  ];

  // When the text field is changed, setImportantElements is executed
  void setImportantElements(int idx, String str) {
    // As long as the user input non-empty string, update importantElements
    if (str != "") {
      importantElements[idx] = str;
    }
    // Check if all text fields have been entered
    // If the list contains empty string, then the above isn't true
    if (importantElements.contains("")) {
      // Change button color
      color = Graphics.GREY;
      canContinue = false;
      return;
    }

    canContinue = true;
    color = Graphics.GREEN;

    // Notify listeners so that all states/widgets are updated accordingly
    notifyListeners();
  }

  // This function is implemented so that the machine running the app does not
  // have to search through importantElements on each text change
  // as this will result in a lot of calculations on each keyboard tap
  void submitImportantElements(int idx, String str) {
    // When the user presses enter on the keyboard, use setImportantElements
    setImportantElements(idx, str);
  }

  // The user input from TheCity2 is stored here
  // Initiated as empty strings
  late List<String> positives = [
    "",
    "",
  ];

  // Stored as seperate lists for easier summary page
  late List<String> negatives = [
    "",
    "",
  ];

  // Same function as from TheCity1
  void setPositives(int idx, String str) {
    if (str != "") {
      positives[idx] = str;
    }

    // Here we need to check both lists
    if (positives.contains("") || negatives.contains("")) {
      color = Graphics.GREY;
      canContinue = false;
      return;
    }

    canContinue = true;
    color = Graphics.GREEN;
    notifyListeners();
  }

  void submitPositives(int idx, String str) {
    setPositives(idx, str);
  }

  void setNegatives(int idx, String str) {
    if (str != "") {
      negatives[idx] = str;
    }

    if (negatives.contains("") || positives.contains("")) {
      color = Graphics.GREY;
      canContinue = false;
      return;
    }

    canContinue = true;
    color = Graphics.GREEN;
    notifyListeners();
  }

  void submitNegatives(int idx, String str) {
    setNegatives(idx, str);
  }

  // Reset the state variables, i.e. button color and continue boolean
  void resetState() {
    canContinue = false;
    color = Graphics.GREY;
    notifyListeners();
  }
}
