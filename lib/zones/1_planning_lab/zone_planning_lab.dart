



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_city/text_types/zone_body.dart';
import 'package:zero_city/text_types/zone_title.dart';

import '../zone_base.dart';

class PlanningLabZone extends ZoneBase {
  PlanningLabZone({Key? key}) : super("Planning Lab", 1, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                children: [
                  ZoneTitle("Planning Lab"),
                  ZoneBody("Zone Description")
                ],
              )
            ],
          ),
        )
    );
  }
}
