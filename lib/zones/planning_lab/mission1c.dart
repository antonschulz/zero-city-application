import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class PlanningLabMission1C extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MissionTitle("Planning Lab 1c"),
          MissionBody("Hur många procent av tiden står en bil stilla? "
              "Svaret hittar ni i utställningen."),
          TextField(
            decoration: InputDecoration(
              hintText: context.read<PlanningLabState>().hint,
            ),
            onSubmitted: (String str) {
              context.read<PlanningLabState>().assing1c(str);
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
              if (context.read<PlanningLabState>().correct) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExhibitionMap()),
                );
              }
            },
            child: const Text("Gå tillbaka till kartan"),
            style: ElevatedButton.styleFrom(
              primary: context.watch<PlanningLabState>().color,
            ),
          ),
        ],
      ),
    );
  }
}
