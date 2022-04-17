import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/missions/container_dropdown.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/power-plant/mission1aX.dart';

class Power_plant_Mission1a extends StatefulWidget {
  const Power_plant_Mission1a({Key? key}) : super(key: key);

  @override
  State<Power_plant_Mission1a> createState() => Power_plant_Mission1aState();
}

class Power_plant_Mission1aState extends State<Power_plant_Mission1a> {
  var dropdownValue = "1";
  var alternatives = ["1", "2"];
  var picture1 = Text("Generator", style: TextStyle(fontSize: 32));
  var picture2 = Text("Rotorblad/Vindturbin", style: TextStyle(fontSize: 32));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Color.fromRGBO(255, 200, 100, 0.5),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MissionTitle(
                    "\nPara ihop vindkraftverkets olika delar med den \nfunktion som de utför"),
                Column(children: [
                  Divider(height: 50, color: Color.fromRGBO(0, 0, 0, 0)),
                  MissionBody(
                      "1. Omvandlar/Genererar rörelseenergin till ström.\n\n\n2. Snurrar runt när det blåser."),
                  Divider(height: 50, color: Color.fromRGBO(0, 0, 0, 0)),
                  /*
                Align(
                    alignment: Alignment.centerLeft,
                    child: MissionBody("2. Snurrar runt när det blåser.")),
                 */
                  Divider(height: 50, color: Color.fromRGBO(0, 0, 0, 0)),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container_dropdown(picture1, alternatives),
                    Container_dropdown(picture2, alternatives)
                  ]),
                ]),
                Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ExhibitionMapProvider>()
                        .setCompleteMission("Power Plant");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Power_plant_Mission1aX()),
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
