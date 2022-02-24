import 'package:flutter/material.dart';

// Button widget which works as answers to a given Q for missions
class Answer extends StatelessWidget {
  // What the answer will do when pressed
  final Function pressAction;

  final Color textColor;

  const Answer(this.pressAction, this.textColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        child: Text(
          "This does not work",
          style: TextStyle(color: textColor),
        ),
        // TODO: fix function pointer to _answerQ in main.dart
        // Gives error at the moment
        onPressed: null,
        // onPressed: pressAction,
      ),
    );
  }
}
