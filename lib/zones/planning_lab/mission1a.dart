import 'package:flutter/material.dart';
import 'package:zero_city/zones/planning_lab/mission1b.dart';
// import 'package:zero_city/const text_types/mission_body.dart';
// import 'package:zero_city/const text_types/mission_title.dart';

class Mission1A extends StatefulWidget {
  const Mission1A({Key? key}) : super(key: key);

  @override
  State<Mission1A> createState() => Mission1AState();
}

class Mission1AState extends State<Mission1A> {
   // Strings for the boxes
  final List<String> strs = [
    "Egen bil som drivs med fossila bränslen",
    "Att köpa nya kläder",
    "Att äta kött",
    "En ny smartphone",
    "En ny dator",
    "Flygresor",
    "Nya möbler",
    "Sociala medier",
    "Nytt tv-spel",
    "Julklappar",
    "Stort boende",
    "Husdjur, som katt eller hund",
    "Att äga en egen bil",
    "Varma bostäder (max 19 grader)",
    "Shoppinggallerior",
    "Swimmingpool",
    "E-handel",
    "Eget rum",
    "Fotbollsplaner med konstgräs",
    "Mat och godis som innehåller palmolja",
    "Snabbmat",
    "Sommarstuga",
    "Avokado och exotiska frukter",
    "Bubbelvatten och sportdrycker",
  ];

  // List to keep answers
  List<String> answers = [];
  
  // Corresponding list of booleans to keep track if the button is clicked
  List<bool> clicked = List.filled(24, false);

  // Count number of buttos pressed
  var _count = 0;

  // Color for continue button
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // MissionTitle("Planning Lab 1a"),
          // MissionBody(
          //     "Vad är ni beredda att avstå från? Välj fem olika alternativ."),
          // Has to be flexible to avoid endless scroll error
          Flexible(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 6,
              // All option buttons are produced through this code
              // Creates a list of length 24
              // For every index of said list: creates a button with text from
              // Corresponding index of list strs
              children: List.generate(24, (index) {
                return ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      // If clicked is false <=> button isn't currently pressed
                      // Now set clicked to true and increment _counter
                      // If 5 options are already picked: do nothing
                      if (!clicked[index] && _count < 5) {
                        clicked[index] = !clicked[index];
                        answers.add(strs[index]);
                        _count++;
                        if (_count == 5) {
                          // Sets continue button colour for UI help
                          color = Colors.green;
                        }
                        // User can deselect an option
                      } else if (clicked[index]) {
                        clicked[index] = !clicked[index];
                        answers.remove(strs[index].toString());
                        _count--;
                        color = Colors.grey;
                      }
                    }),
                  },
                  child: Text(
                    strs[index],
                  ),
                  // Different colour if clicked
                  style: ElevatedButton.styleFrom(
                    primary: clicked[index]
                        ? const Color.fromRGBO(151, 144, 187, 1)
                        : Colors.grey[400],
                    onPrimary: Colors.black,
                  ),
                );
              }),
            ),
          ),
          // Navigator button to next mission page, mission 1b
          ElevatedButton(
            onPressed: () {
              if (_count == 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mission1B(answers)),
                );
              }
            },
            child: const Text("Fortsätt till uppdrag 1b"),
            style: ElevatedButton.styleFrom(
              primary: color,
            ),
          ),
        ],
      ),
    );
  }
}
