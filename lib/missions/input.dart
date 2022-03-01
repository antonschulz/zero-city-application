import 'package:flutter/material.dart';

// Input widget for missions
class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController textController = new TextEditingController();
  var inputStr = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Type here",
          ),
          onSubmitted: (String str) {
            setState(() {
              // Assign the typed str to inputStr
              inputStr = str;
            });
            // Set textController to ""
            // In essence, removes the typed string from 
            // the input box when submitted 
            textController.text = "";
          },
          controller: textController,
        ),
        // Show submitted String under the input box
        Text("Your answer: \n" + inputStr),
      ],
    ));
  }
}
