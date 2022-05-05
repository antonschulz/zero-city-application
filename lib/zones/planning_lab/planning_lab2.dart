import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/zones/planning_lab/planning_lab3.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/utils/Graphics.dart';

// Planning Lab mission 2
class PlanningLab2 extends StatefulWidget {
  const PlanningLab2({Key? key}) : super(key: key);

  @override
  State<PlanningLab2> createState() => _PlanningLab2State();
}

class _PlanningLab2State extends State<PlanningLab2> {
  @override
  Widget build(BuildContext context) {
    List<String> inputList = context.watch<PlanningLabState>().answers;

    return Scaffold(
      backgroundColor: Graphics.LIGHTGREEN,
      body: Column(
        children: [
          MissionTitle("Ohållbara vanor"),
          MissionBody(
              "Välj ett av alternativen nedan som ni valde i föregående fråga att avstå "
              "ifrån. Försök att komma på något miljösmart det kan ersättas med."),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: List.generate(
                    3,
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
                flex: 1,
              ),
              Expanded(
                child: Column(
                  children: List.generate(
                    2,
                    (index) {
                      return RadioListTile(
                        title: Text(inputList[index + 3]),
                        value: index + 3,
                        groupValue: context.watch<PlanningLabState>().group,
                        onChanged: (value) {
                          context.read<PlanningLabState>().setGroup(index + 3);
                        },
                      );
                    },
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: (TextField(
              decoration: const InputDecoration(
                hintText: "Miljösmart ersättning",
              ),
              onSubmitted: (String str) {
                context.read<PlanningLabState>().assign2(str);
              },
            )),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(const Size(250, 80)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  context.watch<PlanningLabState>().color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            child: const Text(
              'Gå vidare',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (context.read<PlanningLabState>().correct) {
                context.read<PlanningLabState>().resetContinueButton();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlanningLab3()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
