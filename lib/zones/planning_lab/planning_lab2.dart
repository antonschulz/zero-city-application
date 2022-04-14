import 'package:flutter/material.dart';
import 'package:zero_city/zones/planning_lab/planning_lab3.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class PlanningLab2 extends StatefulWidget {
  List<String> inputList;

  PlanningLab2(this.inputList, {Key? key}) : super(key: key);

  @override
  State<PlanningLab2> createState() => _PlanningLab2State(inputList);
}

class _PlanningLab2State extends State<PlanningLab2> {
  final List<String> inputList;

  _PlanningLab2State(this.inputList);

  int _group = 0;
  Color color = Colors.grey;
  bool correct = false;

  @override
  Widget build(BuildContext context) {
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
                  groupValue: _group,
                  onChanged: (value) {
                    setState(() {
                      _group = index;
                    });
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
              setState(() {
                // Assign the typed str to inputStr
                if (str != "") {
                  correct = true;
                  color = Colors.green;
                }
              });
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              onPressed: () {
                if (correct) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PlanningLab3()),
                  );
                }
              },
              child: const Text("Gå vidare"),
              style: ElevatedButton.styleFrom(
                primary: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
