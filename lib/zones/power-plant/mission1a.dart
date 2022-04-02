import 'package:flutter/material.dart';
import 'package:zero_city/missions/container_dropdown.dart';
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
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            children: [
              MissionTitle(
                  "\nPara ihop vindkraftverkets olika delar med den \nfunktion som de utför"),
              Column(children: [
                Divider(height: 50),
                Text("1. Omvandlar/Genererar rörelseenergin till ström.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                Divider(height: 50),
                Text("2. Snurrar runt när det blåser.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                Divider(height: 50),
                Row(children: [
                  Container_dropdown(picture1, alternatives),
                  Container_dropdown(picture2, alternatives)
                ]),
              ]),
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
          )
        ],
      ),
    ));
  }
}
