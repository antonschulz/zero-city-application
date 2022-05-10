import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/missions/pairing.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/power-plant/power_plant2.dart';

class PowerPlant1 extends StatefulWidget {
  const PowerPlant1({Key? key}) : super(key: key);

  @override
  State<PowerPlant1> createState() => PowerPlant1State();
}

class PowerPlant1State extends State<PowerPlant1> {
  final List<String> left = [
    "Omvandlar rörelseenergin till ström",
    "Snurrar när det blåser",
  ];
  final List<String> right = [
    "Rotorblad/Vindturbin",
    "Generator",
  ];
  final List<Pair> correct = [
    const Pair(PairState.complete, 1),
    const Pair(PairState.complete, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(255, 200, 100, 0.5),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MissionTitle("\nVindkraftverkets delar"),
                MissionBody("Para ihop rätt alternativ med varandra"),
                const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
                PairingWidget(left, right, correct, buttonTarget),
              ],
            )));
  }
}

Null Function() buttonTarget(BuildContext context) {
  return () {
    context.read<ExhibitionMapProvider>().setCompleteMission("Power Plant");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PowerPlant2()),
    );
  };
}
