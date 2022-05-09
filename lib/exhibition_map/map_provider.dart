import 'package:flutter/material.dart';
import 'package:zero_city/exhibition_map/map.dart';
import 'package:zero_city/utils/Graphics.dart';

class ExhibitionMapProvider with ChangeNotifier {
  late Mission selectedMission;

  late Map<String, bool> completedMission = {
    "Planning Lab": false,
    "The Park": false,
    "Power Plant": false,
    "City Port": false,
    "The Main Street": false,
    "The City": false,
    "The Backstreet": false,
    "The Square": false,
  };

  late bool allCompleted = false;

  static Color unstartedMissionColor = Graphics.HEAVEN;
  static Color completedMissionColor = Graphics.GREEN;

  get getSelectedMission => selectedMission;

  void reset() {
    selectedMission = noMissionSelected;
    notifyListeners();
  }

  void setMission(Mission mission) {
    selectedMission = mission;
    notifyListeners();
  }

  void setCompleteMission(String missionName) {
    if (!completedMission.containsKey(missionName)) {
      throw Exception("Complete mission key not found");
    }

    completedMission[missionName] = true;
    if (!completedMission.values.contains(false)) {
      allCompleted = true;
    }
    notifyListeners();
  }
}
