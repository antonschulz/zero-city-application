import 'package:flutter/material.dart';
import 'package:zero_city/exhibition_map/map.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final String groupName = "Grupp 3"; // For now the group name is constant

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            // takes a container widget (background image) and a column widget with text + button
            Container(
              //Container for the background
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage('assets/images/startsida.png'),
                height: 1000,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0, bottom: 50.0),
              child: Column(
                //Column with text and button
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Välkomna $groupName!',
                    style: const TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(151, 144, 187, 1)),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(250, 80)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(152, 180, 187, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    child: const Text('Börja här!',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      //when pressed move to class "FirstRoute"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExhibitionMap()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
