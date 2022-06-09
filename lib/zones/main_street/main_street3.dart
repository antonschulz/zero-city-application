import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/state/main_street_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class MainStreet3 extends StatefulWidget {
  const MainStreet3({Key? key}) : super(key: key);

  @override
  State<MainStreet3> createState() => MainStreetState3();
}

class MainStreetState3 extends State<MainStreet3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MissionTitle("The Main Street"),
            MissionBody(
                "Tre smarta saker man kan göra av ett par gamla jeans som inte längre används:"),
            const SizedBox(height: 20),
            Container(
              width: 600,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Sak 1",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (String str) {
                  context
                      .read<MainStreetState>()
                      .setSmartThingsWithJeans(0, str);
                },
                onSubmitted: (String str) {
                  context
                      .read<MainStreetState>()
                      .submitSmartThingsWithJeans(0, str);
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 600,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Sak 2",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (String str) {
                  context
                      .read<MainStreetState>()
                      .setSmartThingsWithJeans(1, str);
                },
                onSubmitted: (String str) {
                  context
                      .read<MainStreetState>()
                      .submitSmartThingsWithJeans(1, str);
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 600,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Sak 3",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (String str) {
                  context
                      .read<MainStreetState>()
                      .setSmartThingsWithJeans(2, str);
                },
                onSubmitted: (String str) {
                  context
                      .read<MainStreetState>()
                      .submitSmartThingsWithJeans(2, str);
                },
              ),
            ),
            const SizedBox(height: 20),
            // Navigator button to next mission page, planning_lab2
            ElevatedButton(
              onPressed: () {
                if (context.read<MainStreetState>().canContinue) {
                  context
                      .read<ExhibitionMapProvider>()
                      .setCompleteMission("The Main Street");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExhibitionMap()),
                  );
                }
              },
              child: (context.watch<MainStreetState>().canContinue)
                  ? const Text(
                      "Gå vidare",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      "Skriv 3 saker",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(const Size(250, 80)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    context.watch<MainStreetState>().color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
