import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/the-square/theSquareMission1.dart';

class introPageTheSquare extends StatelessWidget {
  const introPageTheSquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(241, 216, 234, 1),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              MissionTitle("The Square"),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),
              MissionBody(
                  "Vi kan inte lämna över dagens problem till nästa generation. Härifrån och framåt är det vi som"
                  "tillsammans är förändringen! Torget är stadens mötesplats. Här kan vi samlas, umgås och dela"
                  "idéer för hållbar utveckling."),
              const Divider(
                height: 100,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
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
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const theSquareMission1()),
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
