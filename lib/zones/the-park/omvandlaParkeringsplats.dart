import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/the_park_state.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/missions/input.dart';
import 'package:zero_city/exhibition_map/map.dart';

class omvandlaParkering extends StatelessWidget {
  const omvandlaParkering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(241, 216, 234, 1),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              MissionTitle("Omvandla en parkeringsplats!"),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),
              MissionBody(
                  "Har vi inte lika många bilar i staden, så finns det mer yta till annat, till exempel parker. Kan ni "
                  "komma på en annan ny sak som en före detta parkeringsplats skulle kunna bli?"),
              const Divider(
                height: 70,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Skriv här",
                ),
                onChanged: (String str) {
                  context.read<TheParkState>().setText(str);
                },
              ),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),
              // Show submitted String under the input box
              Text(
                  "Erat svar: \n" + context.watch<TheParkState>().parkingAnswer,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontStyle: FontStyle.italic)),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 80)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(152, 180, 187, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const Text('Gå vidare',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                onPressed: () {
                  //when pressed move to class "FirstRoute"
                  context
                      .read<ExhibitionMapProvider>()
                      .setCompleteMission("The Park");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExhibitionMap()),
                  );
                },
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
