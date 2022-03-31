import 'package:flutter/material.dart';
import 'package:zero_city/exhibition_map/map.dart';

class ExhibitionMapProvider with ChangeNotifier {
  late Mission selectedMission;

  get getSelectedMission => selectedMission;

  void reset() {
    selectedMission = noMissionSelected;
    notifyListeners();
  }

  void setMission(Mission mission) {
    selectedMission = mission;
    notifyListeners();
  }
}
