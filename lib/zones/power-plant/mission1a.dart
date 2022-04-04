import 'package:flutter/material.dart';
import 'package:zero_city/missions/container_dropdown.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class Mission1a extends StatefulWidget {
  const Mission1a({Key? key}) : super(key: key);

  @override
  State<Mission1a> createState() => Mission1aState();
}

class Mission1aState extends State<Mission1a> {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mission1a()),
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
