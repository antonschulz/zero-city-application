import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/state/planning_lab_state.dart';
import 'package:zero_city/zones/zone1/zone1_mission1.dart';

import 'exhibition_map/map.dart';
import 'exhibition_map/map_provider.dart';
import 'startsida.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ExhibitionMapProvider()),
      ChangeNotifierProvider(create: (_) => PlanningLabState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MyHomePage(title: 'Zero City Interactive Tool'),
        '/map': (context) => ExhibitionMap(),
        '/zone/1/mission/1': (context) => ZoneOneMissionOne(),
      },
      //theme: ThemeData(
      // This is the theme of your application.
      // primaryColor: const Color.fromRGBO(152, 180, 187, 0.7),
      // ),
    );
  }
}
