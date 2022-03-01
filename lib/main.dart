import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_city/exhibition_map/map.dart';

import 'exhibition_map/map.dart';
import 'exhibition_map/map_provider.dart';
import 'startsida.dart';

//import 'route-testing.dart';
//import './missions/questions.dart';
//import './missions/answers.dart';

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
      title: 'Flutter Demo',
      routes: {
        '/': (context) => MyHomePage(title: 'Zero City Interactive Tool'),
        '/map': (context) => ExhibitionMap(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: const Color.fromRGBO(152, 180, 187, 0.7),
      ),
      home: const MyHomePage(title: 'Zero City Interactive Tool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Index to pick question from array questions
  int _index = 0;

  // TODO: make questions in the array
  var questions = ["Hello", "Goodbye"];

  // Increment _index/change question text when an answer button is pressed
  void _answerQ() {
    if (_index < questions.length - 1) {
      setState(() {
        _index++;
      });

      // Just to see if _answerQ works properly
    }
    print("index number: $_index");
  }

  // Color codes from TM
  var dandelion = const Color.fromARGB(255, 241, 219, 110);
  var lilac = const Color.fromARGB(255, 151, 144, 187);
  var heaven = const Color.fromARGB(255, 152, 180, 187);
  var oyster = const Color.fromARGB(255, 231, 211, 192);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Added images for fun
            Image.asset(
              "assets/images/tm.png",
              width: 200,
            ),
            Image.asset(
              "assets/images/code.gif",
              width: 180,
            ),
            Question(questions[_index], dandelion),
            // TODO: see answers.dart
            Answer(_answerQ, heaven),
            ElevatedButton(
                onPressed: _answerQ, child: const Text("This works")),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/map");
              },
              child: const Text("Map Page"),
            ),
            const Icon(Icons.sentiment_satisfied_alt_sharp),
          ],
        ),
      ),
    );
  }
}
