import 'package:flutter/material.dart';

class MissionTitle extends StatelessWidget {
  late String text;

  MissionTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black45, fontSize: 52),
      ),
    );
  }
}
