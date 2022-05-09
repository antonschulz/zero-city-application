import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/state/backstreet_state.dart';
import 'package:zero_city/state/city_port_state.dart';
import 'package:zero_city/state/main_street_state.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/state/the_city_state.dart';
import 'package:zero_city/state/the_park_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/utils/Graphics.dart';

class Garage extends StatefulWidget {
  const Garage({Key? key}) : super(key: key);

  @override
  State<Garage> createState() => _GarageState();
}

class _GarageState extends State<Garage> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.7, initialPage: 0);
  }

  int activePage = 0;

  late var length =
      context.read<ExhibitionMapProvider>().completedMission.keys.length - 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Graphics.HEAVEN,
      body: Column(
        children: [
          MissionTitle("The Garage"),
          MissionBody(
            "Om ni är klara med alla zoner kan ni gå till garaget för "
            "att jämföra era svar mellan grupperna. Klicka på knapparna nedan "
            "för att se en sammanfattning på era svar för varje zon.",
          ),
          SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              pageSnapping: true,
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  activePage = value;
                });
              },
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Graphics.LIGHTGREEN,
                  child: Column(
                    children: [
                      zoneText("Planning Lab"),
                      missionAnswerList(
                          "Ohållbara vanor ni valde att avstå från: ",
                          context.read<PlanningLabState>().answers),
                      (context.watch<PlanningLabState>().answers.isNotEmpty)
                          ? missionAnswer(
                              "En miljösmart ersättning till er angivna ovana: ",
                              context.read<PlanningLabState>().answers[
                                      context.read<PlanningLabState>().group] +
                                  ' : ' +
                                  context.read<PlanningLabState>().answer2)
                          : Column(
                              children: [
                                missionDescription(
                                    "En miljösmart ersättning till er angivna ovana: "),
                                const Text("---"),
                              ],
                            ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Graphics.PINK,
                  child: Column(
                    children: [
                      zoneText("The Park"),
                      missionAnswer("Vår omvandling av en parkeringsplats är: ",
                          context.read<TheParkState>().parkingAnswer),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Graphics.PINK,
                  child: Column(
                    children: [
                      zoneText("City Port"),
                      missionAnswer("Tid för att packa en container: ",
                          context.read<CityPortState>().timeTaken),
                      missionAnswer(
                        "Det alternativ ni tycker är bäst för att minska onödiga returer: ",
                        context.read<CityPortState>().answer2,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Graphics.PINK,
                  child: Column(
                    children: [
                      zoneText("Main Street"),
                      missionAnswerList(
                          "Tre smarta saker man kan göra av ett par gamla jeans "
                          "som inte längre används: ",
                          context.read<MainStreetState>().smartThingsWithJeans),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Graphics.YELLOW,
                  child: Column(
                    children: [
                      zoneText("The City"),
                      missionAnswerList(
                          "Våra 5 viktigaste saker som ska finnas i en storstad: ",
                          context.read<TheCityState>().importantElements),
                      missionAnswerList("Fördelar med elsparkcyklar: ",
                          context.read<TheCityState>().positives),
                      missionAnswerList("Nackdelar med elsparkcyklar: ",
                          context.read<TheCityState>().negatives),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Graphics.LIGHTGREEN,
                  child: Column(
                    children: [
                      zoneText("Backstreet"),
                      missionAnswer("Vår favoritdoft är: ",
                          context.read<BackstreetState>().text1),
                      missionAnswer("Vi tror att framtiden kommer dofta: ",
                          context.read<BackstreetState>().text2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(length, activePage),
          ),
          const SizedBox(
            height: 32,
          ),
          buildButtons(),
        ],
      ),
    );
  }

  Widget zoneText(String zone) => Text(
        zone,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 32,
        ),
      );

  Widget missionDescription(String missionText) => Text(
        missionText,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 20,
        ),
      );

  Widget missionAnswer(String missionText, String answerText) {
    return Column(
      children: [
        missionDescription(missionText),
        (answerText != "")
            ? Text(
                answerText,
                style: const TextStyle(fontSize: 16),
              )
            : const Text(
                "---",
                style: TextStyle(fontSize: 16),
              )
      ],
    );
  }

  Widget missionAnswerList(String missionText, List<String> answerList) {
    int length = answerList.length;
    if (length > 0) {
      return Column(
        children: [
          missionDescription(missionText),
          Column(
            children: List.generate(
              length,
              (index) => Text(
                answerList[index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          missionDescription(missionText),
          const Text("---"),
        ],
      );
    }
  }

  List<Widget> indicators(pageLength, currentIndex) {
    return List<Widget>.generate(pageLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Graphics.GREEN : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              primary: Graphics.GREEN,
              onPrimary: Colors.black,
            ),
            onPressed: previous,
            child: const Icon(
              Icons.arrow_back,
              size: 32,
            ),
          ),
          stretch ? const Spacer() : const SizedBox(width: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              primary: Graphics.GREEN,
              onPrimary: Colors.black,
            ),
            onPressed: next,
            child: const Icon(
              Icons.arrow_forward,
              size: 32,
            ),
          ),
        ],
      );

  void next() => _controller.nextPage(
      duration: const Duration(microseconds: 500), curve: Curves.easeIn);

  void previous() => _controller.previousPage(
      duration: const Duration(microseconds: 500), curve: Curves.easeIn);
}
