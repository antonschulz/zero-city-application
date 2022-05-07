import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/state/the_park_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/utils/Graphics.dart';

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
              const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
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
              Container(
                height: 100,
                width: 500,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Skriv här",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onChanged: (String str) {
                    context.read<TheParkState>().setText(str);
                  },
                ),
              ),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 80)),
                  backgroundColor: context.read<TheParkState>().completed
                      ? MaterialStateProperty.all<Color>(Graphics.GREEN)
                      : MaterialStateProperty.all<Color>(Graphics.HEAVEN),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),

                child: context.watch<TheParkState>().completed
                    ? const Text('Tillbaka till kartan',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))
                    : Text('Skriv ett svar!',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () {
                  //when pressed and text is filled in move to class "FirstRoute"
                  if (context.read<TheParkState>().completed) {
                    context
                        .read<ExhibitionMapProvider>()
                        .setCompleteMission("The Park");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExhibitionMap()),
                    );
                  }
                },
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
