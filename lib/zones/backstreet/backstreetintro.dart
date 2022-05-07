import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/backstreet/backstreet_mission1a.dart';

// Stateless widget because nothing will be changed on this page
class BackstreetIntro extends StatelessWidget {
  const BackstreetIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold widget allows for easy graphical customization
    return Scaffold(
      // Color is taken from the utils/Graphics.dart file
      backgroundColor: const Color.fromRGBO(160, 214, 190, 1),
      // The 'main' widget
      body: Container(
        child: Column(
          // Widgets are ordered in a column
          children: [
            const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            MissionTitle("Backstreet"),
            // Just some whitespace between widgets for graphics
            const SizedBox(
              height: 50,
            ),
            MissionBody(
              "Innan massproduktionen av bilar kom i gång i USA, var bilen en lyxvara. "
              "När bilar blev billigare och vanligare kom problem som luftföroreningar, trängsel, "
              "buller och olyckor. I slutet av 1990-talet började vi på allvar prata om bilismen och "
              "dess påverkan på klimatet.",
            ),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              onPressed: () {
                // When pressed move to "TheCity1"/first mission
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Backstreet_Mission1a(),
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
