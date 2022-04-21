import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/utils/Graphics.dart';

class PlanningLab3 extends StatefulWidget {
  const PlanningLab3({Key? key}) : super(key: key);

  @override
  State<PlanningLab3> createState() => _PlanningLab3State();
}

class _PlanningLab3State extends State<PlanningLab3> {
  // Fel svar snackbar
  SnackBar snack = const SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text(
      "Fel svar!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: Duration(seconds: 7),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Graphics.PINK,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MissionTitle("Stillastående bilar"),
          const SizedBox(
            height: 16,
          ),
          MissionBody("Hur många procent av tiden står en bil stilla? "
              "Svaret hittar ni i utställningen."),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 400),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "En bil står stilla __% av tiden",
              ),
              keyboardType: TextInputType.number,
              maxLength: 2,
              onSubmitted: (String str) {
                context.read<PlanningLabState>().submit3(str);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (context.read<PlanningLabState>().correct) {
                context
                    .read<ExhibitionMapProvider>()
                    .setCompleteMission("Planning Lab");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExhibitionMap()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snack);
              }
            },
            child: const Text("Vi har hittat svaret! (tillbaka till kartan)"),
            style: ElevatedButton.styleFrom(
              primary: context.watch<PlanningLabState>().color,
            ),
          ),
        ],
      ),
    );
  }
}
