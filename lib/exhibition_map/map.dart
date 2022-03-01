import 'package:flutter/material.dart';

class Mission {
  final String name;
  final int number;

  Mission(this.name, this.number);
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
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        child: Text("Hello ${mission.name}"),
        decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.black,
                width: 1
            )
        ),
      ),
    );
  }
}

List<Mission> missions = [
  Mission("The High Street", 1),
];

List<MissionButton> missionButtons = [
  MissionButton(mission: missions[0], left: 100.0, top: 0, width: 100.0, height: 100.0)
];


Mission noMissionSelected = Mission("No mission selected", 0);

class ExhibitionMap extends StatelessWidget {
  const ExhibitionMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: missionButtons,
      )
    );
  }
}


