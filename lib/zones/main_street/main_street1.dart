import 'package:flutter/material.dart';
import 'package:zero_city/missions/pairing.dart';
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
  final List<Pair> correct = [
    const Pair(PairState.complete, 2),
    const Pair(PairState.complete, 1),
    const Pair(PairState.complete, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Column(
        children: [
          const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
          MissionTitle("Koldioxidutsläpp - Klädesplagg"),
          const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
          MissionBody(
              "Dra ett streck mellan klädesplagget och det koldioxidutsläpp de skapar."),
          const Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),
          PairingWidget(left, right, correct, buttonTarget),
        ],
      ),
    );
  }
}

Null Function() buttonTarget(BuildContext context) {
  return () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainStreet2()),
    );
  };
}
