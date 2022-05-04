import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/missions/pairing.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/main_street/main_street2.dart';

class MainStreet1 extends StatefulWidget {
  const MainStreet1({Key? key}) : super(key: key);

  @override
  State<MainStreet1> createState() => MainStreetState1();
}

class MainStreetState1 extends State<MainStreet1> {
  final List<String> left = ["Polyesterklänning", "Jeans", "T-shirt av bomull"];
  final List<String> right = ["2 Kg CO2", "9 Kg CO2", "15 Kg CO2"];
  // TODO Set this to correct values
  final List<Pair> correct = [
    const Pair(true, 0),
    const Pair(true, 1),
    const Pair(true, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Column(
        children: [
          MissionTitle("Koldioxidutsläpp - Klädesplagg"),
          MissionBody(
              "Dra ett strck mellan klädesplagget och det koldioxidutsläpp de skapar."),
          PairingWidget(left, right, correct),
          // Navigator button to next mission page, planning_lab2
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainStreet2()),
              );
            },
            child: const Text("Fortsätt till nästa uppdrag"),
            style: ElevatedButton.styleFrom(
              primary: context.watch<PlanningLabState>().color,
            ),
          ),
        ],
      ),
    );
  }
}
