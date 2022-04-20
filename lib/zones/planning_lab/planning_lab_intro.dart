import 'package:flutter/material.dart';
import 'package:zero_city/text_types/zone_title.dart';
import 'package:zero_city/text_types/zone_body.dart';
import 'package:zero_city/zones/planning_lab/planning_lab1.dart';

class PlanningLabIntro extends StatelessWidget {
  const PlanningLabIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(241, 216, 234, 1),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  ZoneTitle("Planning Lab"),
                  const Divider(
                    height: 50,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                    color: Color.fromRGBO(241, 216, 234, 1),
                  ),
                  ZoneBody(
                      "Alla transporter som finns idag gör staden lite mindre mysig och hälsosam att bo i, och det krävs "
                      "en ganska stor förändring för att vi ska nå de klimatmål man har satt upp. Om vi klarar vi det, får vi "
                      "också en stad som är bättre och trevligare att leva i. Men då måste vi alla hjälpas åt!"),
                  const SizedBox(
                    height: 100,
                  ),
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
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      //when pressed move to class "FirstRoute"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlanningLab1()),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
