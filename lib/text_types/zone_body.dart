import 'package:flutter/material.dart';

class ZoneBody extends StatelessWidget {
  late String text;

  ZoneBody(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
