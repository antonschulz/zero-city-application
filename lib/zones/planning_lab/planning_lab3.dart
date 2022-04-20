import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class PlanningLab3 extends StatefulWidget {
  const PlanningLab3({Key? key}) : super(key: key);

  @override
  State<PlanningLab3> createState() => _PlanningLab3State();
}

class _PlanningLab3State extends State<PlanningLab3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
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
          ElevatedButton(
            onPressed: () {
              context
                  .read<ExhibitionMapProvider>()
                  .setCompleteMission("Planning Lab");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExhibitionMap()),
              );
            },
            child: const Text("Vi har hittat svaret! (tillbaka till kartan)"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
