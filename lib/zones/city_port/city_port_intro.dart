import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/city_port/city_port1.dart';

class CityPortIntro extends StatelessWidget {
  const CityPortIntro({Key? key}) : super(key: key);

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
                  const Divider(
                    height: 40,
                    color: Color.fromRGBO(241, 216, 234, 1),
                  ),
                  MissionTitle("City Port"),
                  const Divider(
                    height: 50,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                    color: Color.fromRGBO(241, 216, 234, 1),
                  ),
                  MissionBody(
                      "Om stadens klimatavtryck ska minska måste onödiga transporter undvikas. Hur undviker man "
                      "egentligen onödiga transporter av varor till och från staden?"),
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
                            builder: (context) => const CityPort1()),
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
