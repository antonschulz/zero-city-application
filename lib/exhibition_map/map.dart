import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/zone_handler.dart';
import 'package:zero_city/zones/1_planning_lab/mission1a.dart';

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

  setSelectedMission() {

  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
          onTap: () {
            context.read<ExhibitionMapProvider>().setMission(mission);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => mission.missionPage)
            );
          },
          child: Container(
          width: width,
          height: height,
          child: Text("Hello ${mission.name}"),
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

Mission noMissionSelected = Mission("No mission selected", 0, const Text("Nothing"));

class ExhibitionMap extends StatelessWidget {
  static ZoneHandler zone_handler = ZoneHandler();

  ExhibitionMap({Key? key}) : super(key: key);

  static List<Mission> missions = [
    Mission("The High Street", 1, const Text("test")),
    Mission("Planning Lab", 2, const Mission1A()),
  ];

  // This section works, however to see changes, rerun the app
  static List<MissionButton> missionButtons = [
    MissionButton(
        mission: missions[0], left: 50.0, top: 50, width: 100.0, height: 100.0),
    MissionButton(
        mission: missions[1], left: 200.0, top: 50.0, width: 100.0, height: 100.0),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: Decide on how to create the map pag
    return
         Scaffold(
           body: Stack(
            children: missionButtons,
           ),
         );
  }
}
