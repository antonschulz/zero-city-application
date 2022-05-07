import 'package:flutter/material.dart';
import 'package:zero_city/utils/Graphics.dart';

class BackstreetState with ChangeNotifier {
  List<String> year = ["1832", "1875", "1890", "1915", "1926"];
  var continueText = "Testa svar";
  List<Image> images = [
    Image(image: AssetImage('assets/images/bleirot.png')),
    Image(image: AssetImage('assets/images/nordstjärnan.png')),
    Image(image: AssetImage('assets/images/ångmaskinen.png')),
    Image(image: AssetImage('assets/images/ottomotorn.png')),
    Image(image: AssetImage('assets/images/ford.png')),
  ];

  List<String> object = [
    "Flygplanet Bleriot",
    "Cykeln Nordstjärnan",
    "Balansångmaskinen",
    "Ottomotorn",
    "T-Forden",
  ];
  /*
  Pairs holds the pairs: Object -> year
  If there is no pair for the first object then pairs[0] will equal -1.
  If there is a pair between the first object and the first year than
  pairs[0] will equal the index of the corresponding year, that is: 0 in this case.
   */
  List<int> pairs = List.generate(5, (index) {
    return -1;
  });

  // grey, green, blue-isch
  final List<Color> buttonColors = [
    Colors.grey,
    Graphics.GREEN,
    Graphics.BLUE,
  ];

  // color for continue button
  Color currentColorContinueButton = Colors.grey;

  List<Color> currentColorLeft = List.generate(5, (index) {
    return Colors.grey;
  });

  List<Color> currentColorRight = List.generate(5, (index) {
    return Colors.grey;
  });
  // Index for the button selected on left side
  var selectedLeft = -1;
  var selectedRight = -1;
  var lastCreatedPair = true;

  List<double> positionx = List.generate(10, (index) => (0));
  List<double> positiony = List.generate(10, (index) => (0));

  void updatePosition(side, index, key) {
    var currentBox = index;
    if (side == "right") {
      // right side starts at index 4
      currentBox += 5;
    }
    RenderBox box = key.currentContext.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    positionx[currentBox] = position.dx;
    positiony[currentBox] = position.dy;

    notifyListeners();
  }

  void left_onPressed(index, containerKey) {
    /*
    Three cases:
    1. Last button pressed was on left side and did not create a pair
    2. Last button pressed was on right side
    3. Last button pressed created a pair
     */
    updatePosition("left", index, containerKey);
    // case 1
    if (lastCreatedPair == false && (selectedLeft != -1)) {
      currentColorLeft[selectedLeft] = buttonColors[0];
      currentColorLeft[index] = buttonColors[2];
      // remove old pair
      pairs[index] = -1;
      selectedLeft = index;
      lastCreatedPair = false;
    } else
    // case 2
    if (lastCreatedPair == false && (selectedRight != -1)) {
      if (pairs[index] != -1) {
        currentColorRight[pairs[index]] = buttonColors[0];
        pairs[index] = -1;
      }
      pairs[index] = selectedRight;
      currentColorRight[selectedRight] = buttonColors[1];
      currentColorLeft[index] = buttonColors[1];
      selectedRight = -1;
      selectedLeft = -1;
      lastCreatedPair = true;
    } else
    // case 3
    if (lastCreatedPair == true) {
      // already paired
      if (pairs[index] != -1) {
        // change color of the right button
        currentColorRight[pairs[index]] = buttonColors[0];
        // remove the pairing
        pairs[index] = -1;
      }
      currentColorLeft[index] = buttonColors[2];
      selectedLeft = index;
      lastCreatedPair = false;
    }
    if (allPaired()) {
      currentColorContinueButton = buttonColors[2];
    } else {
      currentColorContinueButton = buttonColors[0];
    }
    notifyListeners();
  }

  void right_onPressed(index, containerKey) {
    // update position of widget (button)
    updatePosition("right", index, containerKey);
    /*
    Three cases:
    1. Last button pressed was on right side and did not create a pair
    2. Last button pressed was on left side
    3. Last button pressed created a pair
     */
    // case 1
    if (lastCreatedPair == false && (selectedRight != -1)) {
      currentColorRight[selectedRight] = buttonColors[0];
      currentColorRight[index] = buttonColors[2];
      var pairing = pairs.indexWhere((element) => (element == index));
      // remove old pair
      if (pairing != -1) {
        pairs[pairing] = -1;
      }
      selectedRight = index;
      lastCreatedPair = false;
    } else
    // case 2
    if (lastCreatedPair == false && (selectedLeft != -1)) {
      var pairing = pairs.indexWhere((element) => (element == index));
      if (pairing != -1) {
        currentColorLeft[pairing] = buttonColors[0];
        pairs[pairing] = -1;
      }
      pairs[selectedLeft] = index;
      currentColorLeft[selectedLeft] = buttonColors[1];
      currentColorRight[index] = buttonColors[1];
      selectedRight = -1;
      selectedLeft = -1;
      lastCreatedPair = true;
    } else
    // case 3
    if (lastCreatedPair == true) {
      // already paired
      var pairing = pairs.indexWhere((element) => (element == index));
      if (pairing != -1) {
        // change color of the left button
        currentColorLeft[pairing] = buttonColors[0];
        // remove the pairing
        pairs[pairing] = -1;
      }
      currentColorRight[index] = buttonColors[2];
      selectedRight = index;
      lastCreatedPair = false;
    }
    if (allPaired()) {
      currentColorContinueButton = buttonColors[2];
    } else {
      currentColorContinueButton = buttonColors[0];
    }
    notifyListeners();
  }

  /*
  Checks if all buttons are connected to another button
   */
  bool allPaired() {
    bool allPaired = true;
    for (var i = 0; i < pairs.length; i++) {
      if (pairs[i] == -1) {
        allPaired = false;
      }
    }
    return allPaired;
  }

  void continueButtonPressed(test) {
    notifyListeners();
  }

  var text1 = "";
  var text2 = "";
  void setText1(str) {
    text1 = str;
    notifyListeners();
  }

  void setText2(str) {
    text2 = str;
    notifyListeners();
  }

  // mission 2
  bool completed() {
    if (text1 != "" && (text2 != "")) {
      return true;
    } else {
      return false;
    }
  }
}
