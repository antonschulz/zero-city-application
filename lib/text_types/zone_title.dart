import 'package:flutter/material.dart';

class MissionTitle extends StatelessWidget {
  late String text;

  MissionTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
            fontSize: 58));
  }
}
