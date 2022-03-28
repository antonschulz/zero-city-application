
import 'package:flutter/material.dart';

class MissionBody extends StatelessWidget {
  late String text;

  MissionBody(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.blueAccent,
        )
    );
  }
}
