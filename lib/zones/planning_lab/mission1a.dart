import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

import 'mission1b.dart';

class Mission1A extends StatefulWidget {
  const Mission1A({Key? key}) : super(key: key);

  @override
  State<Mission1A> createState() => Mission1AState();
}

class Mission1AState extends State<Mission1A> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MissionTitle("Planning Lab 1a"),
          MissionBody(
              "Vad är ni beredda att avstå från? Välj fem olika alternativ."),
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
                    context.read<PlanningLabState>().onClick(index)
                  },
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
          // Navigator button to next mission page, mission 1b
          ElevatedButton(
            onPressed: () {
              if (context.read<PlanningLabState>().count == 5) {
                context.read<PlanningLabState>().resetContinueButton();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanningLabMission1B()),
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
