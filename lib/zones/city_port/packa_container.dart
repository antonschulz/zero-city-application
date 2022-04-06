import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/city_port/returer.dart';

class PackaContainer extends StatefulWidget {
  const PackaContainer({Key? key}) : super(key: key);

  @override
  State<PackaContainer> createState() => _PackaContainerState();
}

class _PackaContainerState extends State<PackaContainer> {
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
            MissionTitle("City Port 1a"),
            MissionBody(
                "Att packa rätt och undvika tomrum är ett enkelt sätt att minska "
                "på behovet av transporter. I dag går många lastbilar och fartyg "
                "utan att ha full last, det är ju väldigt onödigt att "
                "transportera luft! Hur kan vi packa smartare så att hela "
                "containern blir full?"),
            MissionBody("Testa och se hur bra ni kan packa. Innan ni startar, "
                "ta ut alla paket så containern är tom. Lyckas ni få alla på "
                "plats, eller får ni några över? Fyll i sådana fall i antalet i "
                "protokollet."),
            TextField(
              decoration: const InputDecoration(
                hintText: "Hur många?",
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
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_enteredText) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Returer()),
                    );
                  }
                },
                child: const Text("Fortsätt till City Port uppdrag 1b"),
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
