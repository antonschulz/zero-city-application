import 'package:flutter/material.dart';
import 'package:zero_city/exhibition_map/map.dart';
// import 'package:zero_city/const text_types/mission_body.dart';
// import 'package:zero_city/const text_types/mission_title.dart';

class Mission1C extends StatefulWidget {
  const Mission1C({Key? key}) : super(key: key);

  @override
  State<Mission1C> createState() => _Mission1CState();
}

class _Mission1CState extends State<Mission1C> {
  Color color = Colors.grey;
  final TextEditingController textController = TextEditingController();
  bool correct = false;
  String correctProcent = "123";
  String _hint = "Skriv 123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // MissionTitle("Planning Lab 1c"),
          // MissionBody("Hur många procent av tiden står en bil stilla?
          //Svaret hittar ni i utställningen."),
          TextField(
            decoration: InputDecoration(
              hintText: _hint,
            ),
            onSubmitted: (String str) {
              setState(() {
                // Assign the typed str to inputStr
                if (str == correctProcent) {
                  correct = true;
                  _hint = correctProcent + " är rätt svar!";
                  color = Colors.green;
                } else {
                  _hint = "Försök igen";
                }
              });
              // Set textController to ""
              // In essence, removes the typed string from
              // the input box when submitted
              textController.text = "";
            },
            controller: textController,
            keyboardType: TextInputType.number,
            maxLength: 3,
          ),
          ElevatedButton(
            onPressed: () {
              if (correct) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExhibitionMap()),
                );
              }
            },
            child: const Text("Gå tillbaka till kartan"),
            style: ElevatedButton.styleFrom(
              primary: color,
            ),
          ),
        ],
      ),
    );
  }
}
