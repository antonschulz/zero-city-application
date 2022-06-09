import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/state/the_city_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/utils/Graphics.dart';

class TheCity2 extends StatefulWidget {
  const TheCity2({Key? key}) : super(key: key);

  @override
  State<TheCity2> createState() => _TheCity2State();
}

class _TheCity2State extends State<TheCity2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Graphics.YELLOW,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            MissionTitle("Elsparkcykeln"),
            const SizedBox(height: 22),
            MissionBody(
                "I dagens städer finns det nu många el-sparkcyklar. De är både älskade och hatade."
                " Kom på två för- och nackdelar med dem."),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              // We need a row of two columns
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Need expanded widget so that the text fields don't run over
                  // the screen
                  Expanded(
                    // A column of positives
                    child: Column(
                      children: [
                        const Text(
                          "Fördelar: ",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Fördel 1: ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          onChanged: (String str) {
                            context.read<TheCityState>().setPositives(0, str);
                          },
                          onSubmitted: (String str) {
                            context
                                .read<TheCityState>()
                                .submitPositives(0, str);
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Fördel 2: ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          onChanged: (String str) {
                            context.read<TheCityState>().setPositives(1, str);
                          },
                          onSubmitted: (String str) {
                            context
                                .read<TheCityState>()
                                .submitPositives(1, str);
                          },
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                  // Create a whitespace box in between the text input fields
                  // Otherwise the two columns will stretch into each other
                  // and looks bad
                  const SizedBox(
                    width: 32,
                  ),
                  // Second column containing negatives
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Nackdelar: ",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Nackdel 1: ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          onChanged: (String str) {
                            context.read<TheCityState>().setNegatives(0, str);
                          },
                          onSubmitted: (String str) {
                            context
                                .read<TheCityState>()
                                .submitNegatives(0, str);
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Nackdel 2: ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          onChanged: (String str) {
                            context.read<TheCityState>().setNegatives(1, str);
                          },
                          onSubmitted: (String str) {
                            context
                                .read<TheCityState>()
                                .submitNegatives(1, str);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              // Button to go back to the map
              child: ElevatedButton(
                onPressed: () {
                  if (context.read<TheCityState>().canContinue) {
                    // Since this is the last mission in this zone,
                    // setCompleteMission is used through ExibitionMapProvider
                    // to change the zone button green, i.e. completed
                    context
                        .read<ExhibitionMapProvider>()
                        .setCompleteMission("The City");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExhibitionMap()),
                    );
                  }
                },
                child: (context.watch<TheCityState>().canContinue)
                    // If canContinue == true
                    ? const Text(
                        "Tillbaka till kartan",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    // If canContinue == false
                    : const Text(
                        "Skriv för- och nackdelar",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(350, 80)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      context.watch<TheCityState>().color),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
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
