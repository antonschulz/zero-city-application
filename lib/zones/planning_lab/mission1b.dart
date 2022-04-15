import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

import 'mission1c.dart';

class PlanningLabMission1B extends StatelessWidget {
  const PlanningLabMission1B({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> inputList = context.watch<PlanningLabState>().answers;
    print(context.read<PlanningLabState>().answer1b);
    return Scaffold(
      body: Column(
        children: [
          MissionTitle("Planning Lab 1b"),
          MissionBody(
              "Välj ett av alternativen nedan som ni valde i fråga 1a att avstå "
              "ifrån. Försök att komma på något miljösmart det kan ersättas med."),
          Column(
            children: List.generate(
              5,
              (index) {
                return RadioListTile(
                  title: Text(inputList[index]),
                  value: index,
                  groupValue: context.watch<PlanningLabState>().group,
                  onChanged: (value) {
                    context.read<PlanningLabState>().setGroup(index);
                  },
                );
              },
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Miljösmart ersättning",
            ),
            onSubmitted: (String str) {
              context.read<PlanningLabState>().assign1b(str);
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              onPressed: () {
                if (context.read<PlanningLabState>().correct) {
                  context.read<PlanningLabState>().resetContinueButton();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanningLabMission1C()),
                  );
                }
              },
              child: const Text("Fortsätt till uppdrag 1c"),
              style: ElevatedButton.styleFrom(
                primary: context.watch<PlanningLabState>().color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
