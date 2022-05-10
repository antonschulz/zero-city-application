import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/the_square_state.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/state/the_square_state.dart';
import 'dart:async';

class theSquareMission1 extends StatefulWidget {
  const theSquareMission1({Key? key}) : super(key: key);

  @override
  State<theSquareMission1> createState() => theSquareMission1State();
}

class theSquareMission1State extends State<theSquareMission1> {
  //static final squareState = TheSquareState();

  final TheSquareState s = new TheSquareState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(241, 216, 234, 1),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
              MissionTitle("Designa er egen stad"),
              const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
              MissionBody(
                  "I spelet kan ni välja vad de olika ytorna ska innehålla (vägar, skog, byggnader, m.m.)."
                  " Hur kan ni förändra staden på fem minuter?"),
              const Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),

              //knapp för att starta timer
              ElevatedButton(
                onPressed: () => {
                  //startTimer
                  if (context.read<TheSquareState>().timerStarted == false)
                    {
                      context.read<TheSquareState>().startTimer(),
                    }
                },
                child: const Text(
                  "Starta timer",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 80)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(62, 125, 196, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),

              const Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),

              //timern

              Text("${context.watch<TheSquareState>().getTime()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      fontSize: 60)),

              const Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),

              //gå vidare till kartan om det gått 5 min
              ElevatedButton(
                onPressed: () {
                  if (context.read<TheSquareState>().timerStarted) {
                    context
                        .read<ExhibitionMapProvider>()
                        .setCompleteMission("The Square");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExhibitionMap()),
                    );
                  }
                },
                child: const Text(
                  "Tillbaka till kartan",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 80)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      context.watch<TheSquareState>().color),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
