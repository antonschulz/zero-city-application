import 'package:flutter/material.dart';
import 'route-testing.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final String groupName = "Grupp 3"; // For now the group name is constant

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[ // takes a container widget (background image) and a column widget with text + button
            Container( //Container for the background
              alignment: Alignment.center,
              child: Image.network(
                'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                height: 1000,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column( //Column with text and button
              mainAxisAlignment: MainAxisAlignment.center,
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
                          color: Colors.red,
                          width: 4.0,
                        ),
                      ),
                    ),
                  ),
                  child: Text('Börja här!',
                      style: Theme.of(context).textTheme.headline1),
                  onPressed: () { //when pressed move to class "FirstRoute"
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
    ); 
  }
}
