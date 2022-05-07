import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_city/state/main_street_state.dart';
import 'package:zero_city/zones/main_street/main_street3.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class MainStreet2 extends StatefulWidget {
  const MainStreet2({Key? key}) : super(key: key);

  @override
  State<MainStreet2> createState() => MainStreetState2();
}

class MainStreetState2 extends State<MainStreet2> {
  // Fel svar snackbar.
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
      duration: Duration(seconds: 7));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 216, 234, 1),
      body: Column(
        children: [
          const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
          MissionTitle("The Main Street"),
          const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
          MissionBody(
              "I Europa slängs i genomsnitt ___ kg kläder per person per år. Fyll i ditt svar nedanför."),
          const Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),
          Container(
            height: 100,
            width: 500,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Svaret finner ni i utställningen!",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              keyboardType: TextInputType.number,
              maxLength: 4,
              onChanged: (String str) {
                context.read<MainStreetState>().setClothesThrown(str);
              },
              onSubmitted: (String str) {
                context.read<MainStreetState>().submitClothesThrown(str);
              },
            ),
          ),






          // Navigator button to next mission page, planning_lab2
          const Divider(height: 20, color: Color.fromRGBO(0, 0, 0, 0)),
          ElevatedButton(
            onPressed: () {
              if (context.read<MainStreetState>().isCorrectAnswer) {
                context.read<MainStreetState>().resetColor();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainStreet3()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snack);
              }
            },
            child: const Text("Gå vidare",style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold)),


            style: ButtonStyle(
              fixedSize:
              MaterialStateProperty.all<Size>(const Size(250, 80)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  context.watch<MainStreetState>().color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),


          ),

        ],
      ),
    );
  }
}
