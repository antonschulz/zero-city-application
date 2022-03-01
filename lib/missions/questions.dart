import 'package:flutter/material.dart';

// Question text widget for mission text
class Question extends StatelessWidget {
  final String questionText;
  final Color textColor;

  const Question(this.questionText, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        child: Text(
          questionText,
          style: TextStyle(color: textColor, fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
