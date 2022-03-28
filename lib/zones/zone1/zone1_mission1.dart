import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class ZoneOneMissionOne extends StatelessWidget {
  
  const ZoneOneMissionOne({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              children: [
                MissionTitle("This is an epic question?"),
                MissionBody("This is the part where we describe the mission (if needed)")
              ],
            )
          ],
        ),
      )
    );
  }
  
}
