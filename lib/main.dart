import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';

import 'exhibition_map/map.dart';
import 'exhibition_map/map_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExhibitionMapProvider()),
      ],
      child: MyApp(),
    )
  );
}

class ExampleStartPage extends StatelessWidget {
  const ExampleStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Hello there"),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Welcome to Flutter',
      routes: {
        '/': (context) => ExampleStartPage(),
        '/map': (context) => ExhibitionMap(),
      },
    );
  }
}
