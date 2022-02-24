import 'package:flutter/material.dart';
import 'startsida.dart';
import 'route-testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        ),
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Zero City'),
    );
  }
}


