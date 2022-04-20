import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/backstreet_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class Backstreet_Mission1a extends StatefulWidget {
  const Backstreet_Mission1a({Key? key}) : super(key: key);

  @override
  State<Backstreet_Mission1a> createState() => Backstreet_Mission1aState();
}

class Backstreet_Mission1aState extends State<Backstreet_Mission1a> {
  int hej() {
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(160, 214, 190, 1),
      body: Column(
        children: [
          Column(
            children: [
              Divider(height: 50, color: Color.fromRGBO(0, 0, 0, 0)),
              MissionTitle("Tidslinjen"),
              MissionBody(
                  "När uppfanns föremålen? Para ihop rätt årtal med rätt sak!"),
            ],
          ),
          Column(
            children: List.generate(4, (index) {
              return Column(
                children: [
                  ElevatedButton(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Column(
                          children: [
                            Text("hej", style: TextStyle(fontSize: 25)),
                            Image(
                                image:
                                    AssetImage('assets/images/startsida.png')),
                          ],
                        ),
                      ),
                    ),
                    onPressed: () => {context.read<BackstreetState>().hej()},
                  ),
                  Divider(height: 5, color: Color.fromRGBO(0, 0, 0, 0)),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
