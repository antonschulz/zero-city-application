import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/utils/Graphics.dart';
import 'package:zero_city/zones/backstreet/backstreetintro.dart';
import 'package:zero_city/zones/city_port/city_port_intro.dart';
import 'package:zero_city/zones/main_street/main_street_intro.dart';
import 'package:zero_city/zones/planning_lab/planning_lab_intro.dart';
import 'package:zero_city/zones/power-plant/power_plant_intro.dart';
import 'package:zero_city/zones/the-park/introPage.dart';
import 'package:zero_city/zones/the-square/theSquareIntroPage.dart';
import 'package:zero_city/zones/the_city/the_city_intro.dart';

import 'map_provider.dart';

class Mission {
  final String name;
  final int zone_id;
  final Widget missionPage;

  Mission(this.name, this.zone_id, this.missionPage);
}

class MissionButton extends StatelessWidget {
  MissionButton({
    required this.mission,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: ObjectKey(mission));

  final Mission mission;
  final double left;
  final double top;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    bool? completedMission =
        context.watch<ExhibitionMapProvider>().completedMission[mission.name];

    return Positioned(
        left: left,
        top: top,
        child: GestureDetector(
          onTap: () {
            context.read<ExhibitionMapProvider>().setMission(mission);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => mission.missionPage));
          },
          child: Container(
            width: width,
            height: height,
            child: Center(
              child: Text(
                mission.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color:
                  completedMission == true ? Graphics.GREEN : Graphics.HEAVEN,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
        ));
  }
}

Mission noMissionSelected = Mission("No mission selected", 0, const Text(""));

class ExhibitionMap extends StatelessWidget {
  const ExhibitionMap({Key? key}) : super(key: key);

  static List<Mission> missions = [
    Mission("The High Street", 0, const Text("test")),
    Mission("Planning Lab", 1, const PlanningLabIntro()),
    Mission("The Park", 2, const introPageThePark()),
    Mission("Power Plant", 3, const PowerPlantIntro()),
    Mission("City Port", 4, const CityPortIntro()),
    Mission("The City", 6, const TheCityIntro()),
    Mission("The Main Street", 5, const MainStreetIntro()),
    Mission("The Backstreet", 7, const BackstreetIntro()),
    Mission("The Square", 8, const introPageTheSquare()),
  ];

  // This section works, however to see changes, rerun the app
  static List<MissionButton> missionButtons = [
    MissionButton(
        mission: missions[2], left: 400, top: 75, width: 200, height: 200.0),
    MissionButton(
        mission: missions[3],
        left: 50.0,
        top: 50.0,
        width: 300.0,
        height: 300.0),
    MissionButton(
        mission: missions[4],
        left: 50.0,
        top: 500.0,
        width: 250.0,
        height: 200.0),
    MissionButton(
        mission: missions[5],
        left: 325,
        top: 375.0,
        width: 250.0,
        height: 100.0),
    MissionButton(
        mission: missions[1], left: 325, top: 525, width: 150, height: 200),
    MissionButton(
        mission: missions[7],
        left: 650,
        top: 50.0,
        width: 350.0,
        height: 250.0),
    MissionButton(
        mission: missions[8], left: 750, top: 400, width: 250, height: 250),
    MissionButton(
        mission: missions[6], left: 500, top: 525, width: 150, height: 200.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: missionButtons,
      ),
    );
  }
}
