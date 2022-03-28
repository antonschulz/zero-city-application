import 'package:flutter/material.dart';
// import 'package:zero_city/const text_types/mission_body.dart';
// import 'package:zero_city/const text_types/mission_title.dart';

class Mission1A extends StatefulWidget {
  Mission1A({Key? key}) : super(key: key);

  @override
  State<Mission1A> createState() => _Mission1AState();
}

class _Mission1AState extends State<Mission1A> {
  List<bool> clicked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // MissionTitle("Planning Lab 1a"),
        // MissionBody(
        //     "Vad är ni beredda att avstå från? Välj fem olika alternativ."),
        Flexible(
            child: GridView.count(
          primary: false,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 6,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[0] && count < 5) {
                    clicked[0] = !clicked[0];
                    count++;
                  } else if (clicked[0]) {
                    clicked[0] = !clicked[0];
                    count--;
                  }
                })
              },
              child: const Text("Egen bil som drivs med fossila bränslen"),
              style: ElevatedButton.styleFrom(
                primary: clicked[0] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[1] && count < 5) {
                    clicked[1] = !clicked[1];
                    count++;
                  } else if (clicked[1]) {
                    clicked[1] = !clicked[1];
                    count--;
                  }
                })
              },
              child: const Text("Att köpa nya kläder."),
              style: ElevatedButton.styleFrom(
                primary: clicked[1] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[2] && count < 5) {
                    clicked[2] = !clicked[2];
                    count++;
                  } else if (clicked[2]) {
                    clicked[2] = !clicked[2];
                    count--;
                  }
                })
              },
              child: const Text("Att äta kött"),
              style: ElevatedButton.styleFrom(
                primary: clicked[2] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[3] && count < 5) {
                    clicked[3] = !clicked[3];
                    count++;
                  } else if (clicked[3]) {
                    clicked[3] = !clicked[3];
                    count--;
                  }
                })
              },
              child: const Text("En ny smartphone"),
              style: ElevatedButton.styleFrom(
                primary: clicked[3] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[4] && count < 5) {
                    clicked[4] = !clicked[4];
                    count++;
                  } else if (clicked[4]) {
                    clicked[4] = !clicked[4];
                    count--;
                  }
                })
              },
              child: const Text("En ny dator"),
              style: ElevatedButton.styleFrom(
                primary: clicked[4] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[5] && count < 5) {
                    clicked[5] = !clicked[5];
                    count++;
                  } else if (clicked[5]) {
                    clicked[5] = !clicked[5];
                    count--;
                  }
                })
              },
              child: const Text("Flygresor"),
              style: ElevatedButton.styleFrom(
                primary: clicked[5] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[6] && count < 5) {
                    clicked[6] = !clicked[6];
                    count++;
                  } else if (clicked[6]) {
                    clicked[6] = !clicked[6];
                    count--;
                  }
                })
              },
              child: const Text("Nya möbler"),
              style: ElevatedButton.styleFrom(
                primary: clicked[6] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[7] && count < 5) {
                    clicked[7] = !clicked[7];
                    count++;
                  } else if (clicked[7]) {
                    clicked[7] = !clicked[7];
                    count--;
                  }
                })
              },
              child: const Text("Sociala medier"),
              style: ElevatedButton.styleFrom(
                primary: clicked[7] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[8] && count < 5) {
                    clicked[8] = !clicked[8];
                    count++;
                  } else if (clicked[8]) {
                    clicked[8] = !clicked[8];
                    count--;
                  }
                })
              },
              child: const Text("Nytt tv-spel"),
              style: ElevatedButton.styleFrom(
                primary: clicked[8] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[9] && count < 5) {
                    clicked[9] = !clicked[9];
                    count++;
                  } else if (clicked[9]) {
                    clicked[9] = !clicked[9];
                    count--;
                  }
                })
              },
              child: const Text("Julklappar"),
              style: ElevatedButton.styleFrom(
                primary: clicked[9] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[10] && count < 5) {
                    clicked[10] = !clicked[10];
                    count++;
                  } else if (clicked[10]) {
                    clicked[10] = !clicked[10];
                    count--;
                  }
                })
              },
              child: const Text("Stort boende"),
              style: ElevatedButton.styleFrom(
                primary: clicked[10] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[11] && count < 5) {
                    clicked[11] = !clicked[11];
                    count++;
                  } else if (clicked[11]) {
                    clicked[11] = !clicked[11];
                    count--;
                  }
                })
              },
              child: const Text("Husdjur, som katt eller hund"),
              style: ElevatedButton.styleFrom(
                primary: clicked[11] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[12] && count < 5) {
                    clicked[12] = !clicked[12];
                    count++;
                  } else if (clicked[12]) {
                    clicked[12] = !clicked[12];
                    count--;
                  }
                })
              },
              child: const Text("Att äga en egen bil"),
              style: ElevatedButton.styleFrom(
                primary: clicked[12] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[13] && count < 5) {
                    clicked[13] = !clicked[13];
                    count++;
                  } else if (clicked[13]) {
                    clicked[13] = !clicked[13];
                    count--;
                  }
                })
              },
              child: const Text("Varma bostäder (max 19 grader)"),
              style: ElevatedButton.styleFrom(
                primary: clicked[13] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[14] && count < 5) {
                    clicked[14] = !clicked[14];
                    count++;
                  } else if (clicked[14]) {
                    clicked[14] = !clicked[14];
                    count--;
                  }
                })
              },
              child: const Text("Shoppinggallerior"),
              style: ElevatedButton.styleFrom(
                primary: clicked[14] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[15] && count < 5) {
                    clicked[15] = !clicked[15];
                    count++;
                  } else if (clicked[15]) {
                    clicked[15] = !clicked[15];
                    count--;
                  }
                })
              },
              child: const Text("Swimmingpool"),
              style: ElevatedButton.styleFrom(
                primary: clicked[15] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[16] && count < 5) {
                    clicked[16] = !clicked[16];
                    count++;
                  } else if (clicked[16]) {
                    clicked[16] = !clicked[16];
                    count--;
                  }
                })
              },
              child: const Text("E-handel"),
              style: ElevatedButton.styleFrom(
                primary: clicked[16] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[17] && count < 5) {
                    clicked[17] = !clicked[17];
                    count++;
                  } else if (clicked[17]) {
                    clicked[17] = !clicked[17];
                    count--;
                  }
                })
              },
              child: const Text("Eget rum"),
              style: ElevatedButton.styleFrom(
                primary: clicked[17] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[18] && count < 5) {
                    clicked[18] = !clicked[18];
                    count++;
                  } else if (clicked[18]) {
                    clicked[18] = !clicked[18];
                    count--;
                  }
                })
              },
              child: const Text("Fotbollsplaner med konstgräs"),
              style: ElevatedButton.styleFrom(
                primary: clicked[18] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[19] && count < 5) {
                    clicked[19] = !clicked[19];
                    count++;
                  } else if (clicked[19]) {
                    clicked[19] = !clicked[19];
                    count--;
                  }
                })
              },
              child: const Text("Mat och godis som innehåller palmolja"),
              style: ElevatedButton.styleFrom(
                primary: clicked[19] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[20] && count < 5) {
                    clicked[20] = !clicked[20];
                    count++;
                  } else if (clicked[20]) {
                    clicked[20] = !clicked[20];
                    count--;
                  }
                })
              },
              child: const Text("Snabbmat"),
              style: ElevatedButton.styleFrom(
                primary: clicked[20] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[21] && count < 5) {
                    clicked[21] = !clicked[21];
                    count++;
                  } else if (clicked[21]) {
                    clicked[21] = !clicked[21];
                    count--;
                  }
                })
              },
              child: const Text("Sommarstuga"),
              style: ElevatedButton.styleFrom(
                primary: clicked[21] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[22] && count < 5) {
                    clicked[22] = !clicked[22];
                    count++;
                  } else if (clicked[22]) {
                    clicked[22] = !clicked[22];
                    count--;
                  }
                })
              },
              child: const Text("Avokado och exotiska frukter"),
              style: ElevatedButton.styleFrom(
                primary: clicked[22] ? Colors.blue : Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  if (!clicked[23] && count < 5) {
                    clicked[23] = !clicked[23];
                    count++;
                  } else if (clicked[23]) {
                    clicked[23] = !clicked[23];
                    count--;
                  }
                })
              },
              child: const Text("Bubbelvatten och sportdrycker"),
              style: ElevatedButton.styleFrom(
                primary: clicked[23] ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        )),
      ],
    ));
  }
}
