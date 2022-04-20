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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(160, 214, 190, 1),
      body: Column(
        children: [
          Column(
            children: [
              Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),
              MissionTitle("Tidslinjen"),
              MissionBody(
                  "När uppfanns föremålen? Para ihop rätt sak med rätt årtal!"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left side buttons
              Column(
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      ElevatedButton(
                        child: Container(
                          width: 300,
                          height: 130,
                          child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: Column(
                              children: [
                                Text(
                                    context
                                        .read<BackstreetState>()
                                        .object[index],
                                    style: TextStyle(fontSize: 25)),
                                Container(
                                  height: 50,
                                  width: 300,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.expand(),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/startsida.png')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onPressed: () => {
                          context.read<BackstreetState>().left_onPressed(index)
                        },
                        style: ElevatedButton.styleFrom(
                          primary: context
                              .watch<BackstreetState>()
                              .currentColorLeft[index],
                          onPrimary: Colors.black,
                        ),
                      ),
                      Divider(height: 10, color: Color.fromRGBO(0, 0, 0, 0)),
                    ],
                  );
                }),
              ),
              VerticalDivider(width: 300),
              // Right side button
              Column(
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      ElevatedButton(
                        child: Container(
                          width: 300,
                          height: 130,
                          child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: Center(
                              child: Text(
                                  context.read<BackstreetState>().year[index],
                                  style: TextStyle(fontSize: 25)),
                            ),
                          ),
                        ),
                        onPressed: () => {
                          context.read<BackstreetState>().right_onPressed(index)
                        },
                        style: ElevatedButton.styleFrom(
                          primary: context
                              .watch<BackstreetState>()
                              .currentColorRight[index],
                          onPrimary: Colors.black,
                        ),
                      ),
                      Divider(height: 10, color: Color.fromRGBO(0, 0, 0, 0)),
                    ],
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
