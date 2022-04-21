import 'package:flutter/material.dart';
import 'package:zero_city/text_types/zone_title.dart';
import 'package:zero_city/text_types/zone_body.dart';
import 'package:zero_city/zones/main_street/main_street1.dart';

class MainStreetIntro extends StatelessWidget {
  const MainStreetIntro({Key? key}) : super(key: key);

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
                  ZoneTitle("The Main Street"),
                  const Divider(
                    height: 50,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                    color: Color.fromRGBO(241, 216, 234, 1),
                  ),
                  ZoneBody(
                      "En stor del av utsläppen kommer från vår konsumtion. Hur vi handlar har betydelse. Kan vi göra på"
                      "ett annat sätt? Hur kan vi tänka hållbart?"),
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
                    child: const Text('Påbörja uppdrag',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      //when pressed move to class "FirstRoute"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainStreet1()),
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
