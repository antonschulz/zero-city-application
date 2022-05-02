import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/utils/Graphics.dart';
import 'package:zero_city/state/city_port_state.dart';
import 'package:zero_city/zones/city_port/city_port2.dart';

class CityPort1 extends StatefulWidget {
  const CityPort1({Key? key}) : super(key: key);

  @override
  State<CityPort1> createState() => CityPort1State();
}

class CityPort1State extends State<CityPort1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            MissionTitle("Packa en container"),
            MissionBody(
                "Att packa rätt och undvika tomrum är ett enkelt sätt att minska "
                "på behovet av transporter. I dag går många lastbilar och fartyg "
                "utan att ha full last, det är ju väldigt onödigt att "
                "transportera luft! Hur kan vi packa smartare så att hela "
                "containern blir full?"),
            const SizedBox(
              height: 16,
            ),
            MissionBody(
                "Försök packa containern så att den blir full på så kort tid "
                "som möjligt. Innan ni startar, ta ut alla paket så containern "
                "är tom. Starta timern för att börja packa! Efter 5 minuter "
                "stängs timern av automatiskt. Er packtid kommer att sparas "
                "för att se vem som packar snabbast!"),
            // Knapp för att starta timer
            ElevatedButton(
              onPressed: () => {
                // startTimer
                if (context.read<CityPortState>().timerOn == false)
                  {
                    context.read<CityPortState>().startTimer(),
                  }
                else
                  {
                    context.read<CityPortState>().stopTimer(),
                  }
              },
              child: context.read<CityPortState>().timerOn
                  ? const Text(
                      "Stoppa timer",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      "Starta timer",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(const Size(350, 80)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.read<CityPortState>().timerOn
                      ? Colors.red
                      : Graphics.BLUE,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Timer
            Text(
              context.watch<CityPortState>().getTime(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 64),
            ),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                if (context.read<CityPortState>().canContinue) {
                  context.read<CityPortState>().timeTaken =
                      context.read<CityPortState>().getTime();
                  context.read<CityPortState>().stopTimer();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CityPort2()),
                  );
                }
              },
              child: const Text(
                "Fortsätt till nästa uppdrag",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(const Size(450, 80)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    context.watch<CityPortState>().color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
