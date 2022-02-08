import 'package:flutter/material.dart';

class Mission {
  final String name;
  final int number;

  const Mission(this.name, this.number);
}

const noMissionSelected = Mission("No mission selected", 0);

class ExhibitionMap extends StatelessWidget {
  const ExhibitionMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello"),
    );
  }
}


