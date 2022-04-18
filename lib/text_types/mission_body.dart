import 'package:flutter/material.dart';

class MissionBody extends StatelessWidget {
  late String text;

  MissionBody(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 22, color: Colors.black26, fontStyle: FontStyle.italic),
      ),
    );
  }
}
