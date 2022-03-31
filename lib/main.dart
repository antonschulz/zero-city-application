import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';

import 'exhibition_map/map.dart';
import 'exhibition_map/map_provider.dart';
import 'missions/answers.dart';
import 'missions/questions.dart';
import 'startsida.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExhibitionMapProvider()),
      ],
      child: const MyApp(),
    )
  );
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
      },
      //theme: ThemeData(
        // This is the theme of your application.
        // primaryColor: const Color.fromRGBO(152, 180, 187, 0.7),
      // ),
    );
  }
}

