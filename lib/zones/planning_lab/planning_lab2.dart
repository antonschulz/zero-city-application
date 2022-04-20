import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/zones/planning_lab/planning_lab3.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class PlanningLab2 extends StatefulWidget {
  const PlanningLab2({Key? key}) : super(key: key);

  @override
  State<PlanningLab2> createState() => _PlanningLab2State();
}

class _PlanningLab2State extends State<PlanningLab2> {
  @override
  Widget build(BuildContext context) {
    List<String> inputList = context.watch<PlanningLabState>().answers;

    print(context.read<PlanningLabState>().answer1b);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Column(
        children: [
          MissionTitle("Ohållbara vanor"),
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
                    MaterialPageRoute(
                        builder: (context) => const PlanningLab3()),
                  );
                }
              },
              child: const Text("Gå vidare"),
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
