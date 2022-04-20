import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/missions/pairing.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class Power_plant_Mission1a extends StatefulWidget {
  const Power_plant_Mission1a({Key? key}) : super(key: key);

  @override
  State<Power_plant_Mission1a> createState() => Power_plant_Mission1aState();
}

class Power_plant_Mission1aState extends State<Power_plant_Mission1a> {
  final List<String> left = [
    "Omvandlar rörelseenergin till ström",
    "Snurrar när det blåser",
  ];
  final List<String> right = [
    "Generator",
    "Rotorblad/Vindturbin",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Color.fromRGBO(255, 200, 100, 0.5),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MissionTitle("\nVindkraftverkets delar"),
                MissionBody("Para ihop rätt alternativ med varandra"),
                Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
                PairingWidget(left: left, right: right),
                Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ExhibitionMapProvider>()
                        .setCompleteMission("Power Plant");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExhibitionMap()),
                    );
                  },
                  child: const Text("Fortsätt till nästa uppdrag"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ],
            )));
  }
}
