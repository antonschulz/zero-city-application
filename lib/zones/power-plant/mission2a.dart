import 'package:flutter/material.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';

class mission2a extends StatelessWidget {
  const mission2a({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(255, 200, 100, 0.5),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
              MissionTitle("Generera egen energi!"),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(0, 0, 0, 0),
              ),
              MissionBody(
                  "Låt två av er cykla och försöka hålla i gång generatorn. Hur många watt kan ni trampa fram? "
                  "Fundera på vad som avgör hur många watt ni skapar? Tid eller kraft?"),
              const Divider(
                height: 100,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(0, 0, 0, 0),
              ),
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
                child: const Text('Tillbaka till kartan',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () {
                  //when pressed move to class "FirstRoute"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExhibitionMap()),
                  );
                },
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
