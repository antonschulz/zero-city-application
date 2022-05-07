import 'package:flutter/material.dart';
import 'package:zero_city/text_types/zone_title.dart';
import 'package:zero_city/text_types/zone_body.dart';
import 'package:zero_city/zones/planning_lab/planning_lab1.dart';
import 'package:zero_city/utils/Graphics.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

/// Planning Lab introduction page
/// Contains general information about the zone
class PlanningLabIntro extends StatelessWidget {
  const PlanningLabIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Graphics.LIGHTGREEN,
      body: Container(
        // Padding around text
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            MissionTitle("Planning Lab"),
            const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            MissionBody(
                "Alla transporter som finns idag gör staden lite mindre mysig och hälsosam att bo i, och det krävs "
                "en ganska stor förändring för att vi ska nå de klimatmål man har satt upp. Om vi klarar vi det, får vi "
                "också en stad som är bättre och trevligare att leva i. Men då måste vi alla hjälpas åt!"),
            const Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),

            // Button directs to first mission in planning lab

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
                // When pressed move to "PlanningLab1"/first mission
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlanningLab1()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
