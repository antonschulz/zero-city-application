import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/power-plant/power_plant1.dart';

// Stateless widget because nothing will be changed on this page
class PowerPlantIntro extends StatelessWidget {
  const PowerPlantIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold widget allows for easy graphical customization
    return Scaffold(
      // Color is taken from the utils/Graphics.dart file
      // The 'main' widget
      body: Container(
        color: const Color.fromRGBO(255, 200, 100, 0.5),
        child: Column(
          // Widgets are ordered in a column
          children: [
            const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            MissionTitle("Power Plant"),
            // Just some whitespace between widgets for graphics
            const SizedBox(
              height: 50,
            ),
            MissionBody(
              "Energiproduktion. Idag drivs de flesta bilar med fossila bränslen. "
              "För att åstadkomma en stad utan utsläpp och nå klimatmålen måste vi "
              "gå över till förnyelsebara drivmedel. "
              "Hur fungerar ett vindkraftverk? "
              "Testa modellen som finns i utställningen. ",
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
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              onPressed: () {
                // When pressed move to "TheCity1"/first mission
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PowerPlant1(),
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
