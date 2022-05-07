import 'package:flutter/material.dart';
import 'package:zero_city/text_types/mission_body.dart';
import 'package:zero_city/text_types/mission_title.dart';
import 'package:zero_city/zones/the-park/omvandlaParkeringsplats.dart';

class dansaFramParken extends StatelessWidget {
  const dansaFramParken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

              MissionTitle("Dansa fram staden!"),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),
              MissionBody(
                  "Hittar ni dansmattorna? Bra! Nu är det dags att ta fram era bästa moves och dansa staden grön. Här "
                  "handlar det inte om att hitta svaret på någon fråga eller så, bara att röra på sig. Let’s dance!"
                  " (Tips: Ni måste nog hjälpas åt.)"),
              const Divider(
                height: 100,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Color.fromRGBO(241, 216, 234, 1),
              ),

              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(const Size(250, 80)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(152, 180, 187, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const Text('Gå vidare',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
                onPressed: () {
                  //when pressed move to class "FirstRoute"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const omvandlaParkering()),
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
