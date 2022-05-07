import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/state/backstreet_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/utils/Graphics.dart';

class Backstreet_Mission2a extends StatefulWidget {
  const Backstreet_Mission2a({Key? key}) : super(key: key);

  @override
  State<Backstreet_Mission2a> createState() => Backstreet_Mission2aState();
}

class Backstreet_Mission2aState extends State<Backstreet_Mission2a> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(160, 214, 190, 1),
      body: Center(
        child: Column(
          children: [
            Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            MissionTitle("Doftorgeln"),
            Divider(
              height: 40,
              color: Color.fromRGBO(0, 0, 0, 0),
            ),
            MissionBody("Testa doftorgeln!\n"
                "Vilken doft är gruppens favorit? Hur tror ni att det doftar i framtidens stad?"),
            Divider(
              height: 40,
              color: Color.fromRGBO(0, 0, 0, 0),
            ),
            // svar grejer
            Container(
              height: 100,
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Favoritdoften är: ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (String str) {
                  context.read<BackstreetState>().setText1(str);
                },
              ),
            ),
            Container(
              height: 100,
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "I framtiden tror vi att det kommer att dofta: ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (String str) {
                  context.read<BackstreetState>().setText2(str);
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(const Size(250, 80)),
                backgroundColor: context.read<BackstreetState>().completed()
                    ? MaterialStateProperty.all<Color>(Graphics.GREEN)
                    : MaterialStateProperty.all<Color>(Graphics.HEAVEN),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              child: context.watch<BackstreetState>().completed()
                  ? const Text('Tillbaka till kartan',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                  : Text('Skriv ett svar!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              onPressed: () {
                //when pressed and text is filled in move to class "FirstRoute"
                if (context.read<BackstreetState>().completed()) {
                  context
                      .read<ExhibitionMapProvider>()
                      .setCompleteMission("The Backstreet");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExhibitionMap()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
