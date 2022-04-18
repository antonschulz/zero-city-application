import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class CityPort2 extends StatefulWidget {
  const CityPort2({Key? key}) : super(key: key);

  @override
  State<CityPort2> createState() => _CityPort2State();
}

class _CityPort2State extends State<CityPort2> {
  int _group = 0;

  final List<String> alternatives = [
    "Inför en lag som gör att man bara får lämna tillbaka fem produkter per år.",
    "Köp färre saker online - så vi inte behöver returnera så mycket!",
    "Köp lokalt, så att du kan returnera genom att besöka butiken själv.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            MissionTitle("Onödiga returer"),
            MissionBody(
                "Att beställa varor på nätet känns både smidigt och ofta billigt. "
                "Problemet är att vi ofta beställer mer än vad vi behöver och "
                "skickar tillbaka saker vi inte vill ha, eller som inte passar. "
                "Så kallat ”returnerat gods” är faktiskt ett stort problem som "
                "innebär ännu fler transporter, vilket såklart påverkar miljön "
                "negativt."),
            MissionBody("Välj det alternativ ni tycker är bäst för att minska "
                "onödiga returer:"),
            Column(
              children: List.generate(
                3,
                (index) {
                  return RadioListTile(
                    title: Text(alternatives[index]),
                    value: index,
                    groupValue: _group,
                    onChanged: (value) {
                      setState(() {
                        _group = index;
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<ExhibitionMapProvider>()
                      .setCompleteMission("City Port");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExhibitionMap()),
                  );
                },
                child: const Text("Tillbaka till kartan"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
