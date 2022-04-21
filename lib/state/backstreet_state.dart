import 'package:flutter/material.dart';

class BackstreetState with ChangeNotifier {
  List<String> year = ["1832", "1875", "1890", "1915", "1926"];

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
  final List<Color> buttonColors = [Colors.grey, Colors.green, Colors.cyan];

  List<Color> currentColorLeft = List.generate(5, (index) {
    return Colors.grey;
  });

  List<Color> currentColorRight = List.generate(5, (index) {
    return Colors.grey;
  });
  // Index for the button selected on left side
  var selectedLeft = -1;

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
    When an item on the left side is pressed:
    - Remove the current pair that the item is connected to
    - Update the currently selected left button
    - Update the color of the pressed button
    - Update the color of previously pressed button if it is on left side
    - If there is a paired button -> change color for it as well
    - Update coordinates
     */

    // update position of widget (button)
    updatePosition("left", index, containerKey);

    // change color of connected pair
    if (pairs[index] != -1) {
      currentColorRight[pairs[index]] = buttonColors[0];
    }
    // remove current pair
    pairs[index] = -1;
    // remove blue color if prev button selected was on left side
    if (selectedLeft != -1) {
      if (currentColorLeft[selectedLeft] == buttonColors[2]) {
        currentColorLeft[selectedLeft] = buttonColors[0];
      }
    }
    // change color of currently selected button
    currentColorLeft[index] = buttonColors[2];
    // change currently selected button
    selectedLeft = index;

    notifyListeners();
  }

  void right_onPressed(index, containerKey) {
    updatePosition("right", index, containerKey);
    // oldConnected holds the index of the old left button connected to this
    // right side item, if there is none: then oldConnected = -1
    var oldConnected = pairs.indexWhere((element) => (element == index));
    /*
    - Create a pair between right and left if there is a selected left
    - Change color of left and right side
     */
    if (selectedLeft != -1) {
      // If there is no existing pair to this right button
      if (oldConnected == -1) {
        pairs[selectedLeft] = index;
        currentColorLeft[selectedLeft] = buttonColors[1];
        currentColorRight[index] = buttonColors[1];
      } else {
        /*
      If we get here there is already an connection to the pressed right button
      - Remove current connection then create new connection
       */
        pairs[oldConnected] = -1;
        currentColorLeft[oldConnected] = buttonColors[0];

        // create new pair
        pairs[selectedLeft] = index;
        currentColorLeft[selectedLeft] = buttonColors[1];
        currentColorRight[index] = buttonColors[1];
      }
    }
    // reset so no button is selected on left side
    selectedLeft = -1;
    notifyListeners();
  }
}
