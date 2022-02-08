import 'package:flutter/material.dart';
import 'package:zero_city/exhibition_map/map.dart';

class MapProvider with ChangeNotifier {
  late Mission selectedMission;

  get getSelectedMission => selectedMission;
  set setMission(mission) => selectedMission = mission;

  void reset() {
    selectedMission = noMissionSelected;
    notifyListeners();
  }
}
