import 'package:flutter/material.dart';
import 'route-testing.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"
  final String title;
  final String groupName = "Grupp 3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(
                'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                height: 1000,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Välkommen! Ert lagnamn är:',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  '$groupName',
                  style: Theme.of(context).textTheme.headline2,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Colors.teal,
                          width: 4.0,
                        ),
                      ),
                    ),
                  ),
                  child: Text('Börja här!',
                      style: Theme.of(context).textTheme.headline3),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstRoute()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
