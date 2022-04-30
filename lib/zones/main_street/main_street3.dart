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
      body: Column(
        children: [
          MissionTitle("The Main Street"),
          MissionBody(
              "Tre smarta saker man kan göra av ett par gamla jeans som inte längre används:"),
          TextField(
            decoration: const InputDecoration(
              hintText: "Sak 1",
            ),
            onChanged: (String str) {
              context.read<MainStreetState>().setSmartThingsWithJeans(0, str);
            },
            onSubmitted: (String str) {
              context
                  .read<MainStreetState>()
                  .submitSmartThingsWithJeans(0, str);
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Sak 2",
            ),
            onChanged: (String str) {
              context.read<MainStreetState>().setSmartThingsWithJeans(1, str);
            },
            onSubmitted: (String str) {
              context
                  .read<MainStreetState>()
                  .submitSmartThingsWithJeans(1, str);
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Sak 3",
            ),
            onChanged: (String str) {
              context.read<MainStreetState>().setSmartThingsWithJeans(2, str);
            },
            onSubmitted: (String str) {
              context
                  .read<MainStreetState>()
                  .submitSmartThingsWithJeans(2, str);
            },
          ),
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
                ? const Text("Gå vidare")
                : const Text("Skriv 3 saker"),
            style: ElevatedButton.styleFrom(
              primary: context.watch<MainStreetState>().color,
            ),
          ),
        ],
      ),
    );
  }
}
