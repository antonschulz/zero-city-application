



import 'dart:collection';

import 'package:zero_city/zones/1_planning_lab/mission1a.dart';
import 'package:zero_city/zones/mission_base.dart';
import 'package:zero_city/zones/zone_base.dart';


// Purpose is to be able to direct to user to the correct page when clicking in the map.
class ZoneHandler {
  static Map<int, MissionBase> zoneMission = new HashMap();

  void fillMap() {
    zoneMission[1] = const Mission1A() as MissionBase;
  }
}

