import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/exhibition_map/map_provider.dart';
import 'package:zero_city/state/backstreet_state.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/backstreet/backstreet_mission2a.dart';

double boxWidth = 200;
double boxHeight = 90;

SnackBar snack = const SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text(
      "Fel svar!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: Duration(seconds: 2));

class LinePainter extends CustomPainter {
  List<double> positionx;
  List<double> positiony;
  List<int> pairs;
  var points;
  LinePainter(this.positionx, this.positiony, this.pairs);

  // create point-pairs for each pair that is connected
  void pointGenerator() {
    points = List.generate(10, (index) => (Offset(0, 0)));
    // ugly homemade for each enumerate loop
    var count = 0;
    for (var i in pairs) {
      // if there is a pair
      if (i != -1) {
        points[count] = Offset(
            positionx[count] + boxWidth, positiony[count] + (boxHeight / 2));
        points[count + 5] =
            Offset(positionx[i + 5], positiony[i + 5] + (boxHeight / 2));
      }
      count += 1;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    pointGenerator();
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < 5; i++) {
      canvas.drawLine(points[i], points[i + 5], paint);
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => false;
}

class Backstreet_Mission1a extends StatefulWidget {
  const Backstreet_Mission1a({Key? key}) : super(key: key);

  @override
  State<Backstreet_Mission1a> createState() => Backstreet_Mission1aState();
}

class Backstreet_Mission1aState extends State<Backstreet_Mission1a> {
  bool readyToMoveOn = false;
  List<GlobalKey> keyCap = List<GlobalKey>.generate(
      10, (index) => GlobalKey(debugLabel: 'key_$index'),
      growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(160, 214, 190, 1),
      body: CustomPaint(
        painter: LinePainter(
          context.watch<BackstreetState>().positionx,
          context.watch<BackstreetState>().positiony,
          context.watch<BackstreetState>().pairs,
        ),
        child: Column(
          children: [
            Column(
              children: [
                Divider(height: 5, color: Color.fromRGBO(0, 0, 0, 0)),
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
                  children: List.generate(5, (index) {
                    return Column(
                      children: [
                        ElevatedButton(
                          key: keyCap[index],
                          child: Container(
                            width: boxWidth,
                            height: boxHeight,
                            child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Column(
                                children: [
                                  Text(
                                      context
                                          .read<BackstreetState>()
                                          .object[index],
                                      style: TextStyle(fontSize: 20)),
                                  Container(
                                    height: 50,
                                    width: 300,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints.expand(),
                                      child: context
                                          .read<BackstreetState>()
                                          .images[index],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onPressed: () => {
                            context
                                .read<BackstreetState>()
                                .left_onPressed(index, keyCap[index])
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
                  children: List.generate(5, (index) {
                    return Column(
                      children: [
                        ElevatedButton(
                          key: keyCap[index + 5],
                          child: Container(
                            width: boxWidth,
                            height: boxHeight,
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
                            context
                                .read<BackstreetState>()
                                .right_onPressed(index, keyCap[index + 5])
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
            // Continue-button
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(const Size(250, 80)),
                backgroundColor: MaterialStateProperty.all<Color>(context
                    .watch<BackstreetState>()
                    .currentColorContinueButton),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              /*
              style: ElevatedButton.styleFrom(
                primary:
                    context.watch<BackstreetState>().currentColorContinueButton,
                onPrimary: Colors.black,
              ),
              */
              onPressed: () {
                var allPairsCorrect = true;
                var pairs = context.read<BackstreetState>().pairs;
                var correctAnswers = [3, 2, 0, 1, 4];
                for (var i = 0; i < pairs.length; i++) {
                  if (pairs[i] != correctAnswers[i]) {
                    allPairsCorrect = false;
                  }
                }
                if (allPairsCorrect) {
                  context
                      .read<ExhibitionMapProvider>()
                      .setCompleteMission("The Backstreet");
                  context.read<BackstreetState>().continueText = "Gå vidare";
                  context.read<BackstreetState>().currentColorContinueButton =
                      context.read<BackstreetState>().buttonColors[1];
                  if (readyToMoveOn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Backstreet_Mission2a()),
                    );
                  }
                  readyToMoveOn = true;
                  context
                      .read<BackstreetState>()
                      .continueButtonPressed(readyToMoveOn);
                } else {
                  // fel meddelande
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              },
              child: Text(context.read<BackstreetState>().continueText,
                  style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
