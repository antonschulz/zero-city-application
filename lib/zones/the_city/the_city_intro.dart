import 'package:flutter/material.dart';
import 'package:zero_city/text_types/zone_title.dart';
import 'package:zero_city/text_types/zone_body.dart';
import 'package:zero_city/utils/Graphics.dart';
import 'package:zero_city/zones/the_city/the_city1.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

// Stateless widget because nothing will be changed on this page
class TheCityIntro extends StatelessWidget {
  const TheCityIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold widget allows for easy graphical customization
    return Scaffold(
      // Color is taken from the utils/Graphics.dart file
      backgroundColor: Graphics.YELLOW,
      // The 'main' widget
      body: Container(
        // Margin around text from all edges
        margin: const EdgeInsets.all(32),
        child: Column(
          // Widgets are ordered in a column
          children: [
            const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            MissionTitle("The City"),
            // Just some whitespace between widgets for graphics
            const SizedBox(
              height: 50,
            ),
            MissionBody(
                "I dagens städer är arbetsplatser, fritidsaktiviteter och nöjesställen utspridda. Stadsplaneringen "
                "har gjort det svårt att leva utan bil, men om stadens klimatavtryck ska minska måste vi tänka "
                "om. Visionen om 15-minutersstaden innebär att allt en stadsbo behöver ska finnas nära, inom "
                "15 minuter med cykel."),
            const SizedBox(
              height: 100,
            ),
            // Button directs to first mission in the city


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
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold )),
              onPressed: () {
                // When pressed move to "TheCity1"/first mission
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TheCity1(),
                  ),
                );
              },
            ),




          ],
        ),
      ),
    );
  }
}
