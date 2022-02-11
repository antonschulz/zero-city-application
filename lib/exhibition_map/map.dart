import 'dart:ffi';

import 'package:flutter/material.dart';

class Mission {
  final String name;
  final int number;

  Mission(this.name, this.number);
}

class MissionButton  {
    Mission mission;
    double left;
    double top;
    double width;
    double height;

    MissionButton(this.mission, this.left, this.top, this.width, this.height);
}

List<Mission> missions = [
  Mission("The High Street", 1),
];

List<MissionButton> missionButtons = [
  MissionButton(missions[0], 0, 0, 100, 100),
];


Mission noMissionSelected = Mission("No mission selected", 0);

class ExhibitionMap extends StatelessWidget {
  const ExhibitionMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            for (MissionButton btn in missionButtons) Positioned(
                left: btn.left,
                top: btn.top,
                child: Container(
                  width: btn.width,
                  height: btn.height,
                  child: Text("Hello ${btn.mission.name}"),
                  decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1
                      )
                  ),
                ),
              )
        ],
      )
    );
  }
}

