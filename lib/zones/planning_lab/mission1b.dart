import 'package:flutter/material.dart';
import 'package:zero_city/zones/planning_lab/mission1c.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class Mission1B extends StatefulWidget {
  List<String> inputList;

  Mission1B(this.inputList, {Key? key}) : super(key: key);

  @override
  State<Mission1B> createState() => _Mission1BState(inputList);
}

class _Mission1BState extends State<Mission1B> {
  final List<String> inputList;

  _Mission1BState(this.inputList);

  int _group = 0;
  Color color = Colors.grey;
  bool correct = false;

  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => const Mission1C()),
                  );
                }
              },
              child: const Text("Fortsätt till uppdrag 1c"),
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
