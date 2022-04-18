import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/city_port/city_port2.dart';

class CityPort1 extends StatefulWidget {
  const CityPort1({Key? key}) : super(key: key);

  @override
  State<CityPort1> createState() => _CityPort1State();
}

class _CityPort1State extends State<CityPort1> {
  Color color = Colors.grey;
  bool _enteredText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            MissionTitle("Packa en container"),
            MissionBody(
                "Att packa rätt och undvika tomrum är ett enkelt sätt att minska "
                "på behovet av transporter. I dag går många lastbilar och fartyg "
                "utan att ha full last, det är ju väldigt onödigt att "
                "transportera luft! Hur kan vi packa smartare så att hela "
                "containern blir full?"),
            const SizedBox(
              height: 16,
            ),
            MissionBody("Testa och se hur bra ni kan packa. Innan ni startar, "
                "ta ut alla paket så containern är tom. Lyckas ni få alla på "
                "plats, eller får ni några över? Fyll i sådana fall i antalet i "
                "protokollet."),
            TextField(
              decoration: const InputDecoration(
                hintText: "Hur många paket blev över?",
              ),
              keyboardType: TextInputType.number,
              maxLength: 3,
              onSubmitted: (String str) {
                setState(() {
                  // Assign the typed str to inputStr
                  if (str != "") {
                    _enteredText = true;
                    color = Colors.green;
                  }
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_enteredText) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CityPort2()),
                    );
                  }
                },
                child: const Text("Fortsätt till nästa uppdrag"),
                style: ElevatedButton.styleFrom(
                  primary: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
