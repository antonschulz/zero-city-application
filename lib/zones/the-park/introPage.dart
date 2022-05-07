import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/the-park/dansaFramParken.dart';

class introPageThePark extends StatelessWidget {
  const introPageThePark({Key? key}) : super(key: key);

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
              MissionTitle("The Park"),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),
              MissionBody(
                  "En stad är beroende av grönområden för att människorna som bor där ska trivas och må bra! I "
                  "parker kan man umgås och växterna ger syre åt staden. Om en del av de platser som idag används "
                  "till parkeringar och trafiklösningar för bilar kan omvandlas till grönområden, kan vi göra staden mer"
                  " trivsam för alla som bor där?"),
              const Divider(
                height: 100,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),

              //old button

              /*
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const dansaFramParken()),
                  );
                },
              ),

               */

              //new button
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(const Size(250, 80)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(152, 180, 187, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const Text('Påbörja uppdrag',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
                onPressed: () {
                  //when pressed move to class "FirstRoute"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const dansaFramParken()),
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
