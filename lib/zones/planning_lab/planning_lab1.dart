import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/zones/planning_lab/planning_lab2.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class PlanningLab1 extends StatefulWidget {
  const PlanningLab1({Key? key}) : super(key: key);

  @override
  State<PlanningLab1> createState() => PlanningLab1State();
}

class PlanningLab1State extends State<PlanningLab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Column(
        children: [
          MissionTitle("Ohållbara vanor"),
          MissionBody(
              "Vad är ni beredda att avstå från? Välj fem olika alternativ."),
          Flexible(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              // 6 buttons per row
              crossAxisCount: 6,
              // 4 pixels between each button
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              // AspectRatio needed to shrink the grid-buttons vertically to fit sceen
              childAspectRatio: 2,
              // All option buttons are produced through this code
              // Creates a list of length 24
              // For every index of said list: creates a button with text from
              // Corresponding index of list strs
              children: List.generate(24, (index) {
                return ElevatedButton(
                  onPressed: () =>
                      {context.read<PlanningLabState>().onClick(index)},
                  child: Text(
                    context.watch<PlanningLabState>().strs[index],
                  ),
                  // Different colour if clicked
                  style: ElevatedButton.styleFrom(
                    primary: context.watch<PlanningLabState>().clicked[index]
                        ? const Color.fromRGBO(151, 144, 187, 1)
                        : Colors.grey[400],
                    onPrimary: Colors.black,
                  ),
                );
              }),
            ),
          ),
          // Navigator button to next mission page, planning_lab2
          ElevatedButton(
            onPressed: () {
              if (context.read<PlanningLabState>().count == 5) {
                context.read<PlanningLabState>().resetContinueButton();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanningLab2()),
                );
              }
            },
            child: const Text("Fortsätt till uppdrag 1b"),
            style: ElevatedButton.styleFrom(
              primary: context.watch<PlanningLabState>().color,
            ),
          ),
        ],
      ),
    );
  }
}
