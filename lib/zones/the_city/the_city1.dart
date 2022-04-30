import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/the_city/the_city2.dart';
import 'package:zero_city/state/the_city_state.dart';
import 'package:zero_city/utils/Graphics.dart';
import 'package:provider/src/provider.dart';

// Stateful widget because user input will alter the state of the page
// and change some graphical aspects
class TheCity1 extends StatefulWidget {
  const TheCity1({Key? key}) : super(key: key);
  @override
  State<TheCity1> createState() => TheCity1State();
}

class TheCity1State extends State<TheCity1> {
  // Prefix underscore _ makes list private for this class
  final List<String> _hints = [
    "Det absolut viktigaste är: ",
    "Det är viktigt att det finns: ",
    "Och så måste det finnas: ",
    "Man får inte glömma: ",
    "Sen är det ju väldigt bra om det finns: ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Graphics.PINK,
      body: Container(
        // Create some horizontal margin to the side edges
        margin: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            MissionTitle("Funktioner i staden"),
            MissionBody(
                "Vilka tycker ni är de fem viktigaste sakerna som ska finnas i en storstad?"),
            Column(
              // Generate a list of text input widgets
              children: List.generate(
                // Of same length as _hints
                _hints.length,
                // Keep track of index
                (index) {
                  // User text input widget
                  return TextField(
                    // Create some decoration for usability

                    decoration: InputDecoration(
                      // Hint text from _hints list with index
                      hintText: _hints[index],
                    ),
                    onChanged: (String str) {
                      context
                          // See TheCityState comments on these functions
                          .read<TheCityState>()
                          .setImportantElements(index, str);
                    },
                    onSubmitted: (String str) {
                      context
                          .read<TheCityState>()
                          .submitImportantElements(index, str);
                    },
                  );
                },
              ),
            ),
            Container(
              // Create some margin to the last text input
              margin: const EdgeInsets.only(top: 32.0),
              // Create button to go to next mission
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(400, 80)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      context.watch<TheCityState>().color),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                // Change style depending on canContinue bool from TheCityState
                child: (context.watch<TheCityState>().canContinue)
                    // If canContinue == true
                    ? const Text(
                        "Gå vidare",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    // If canContinue == false
                    : const Text(
                        "Skriv 5 saker",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                onPressed: () {
                  // Only works if canContinue == true
                  if (context.read<TheCityState>().canContinue) {
                    context.read<TheCityState>().resetState();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TheCity2()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
