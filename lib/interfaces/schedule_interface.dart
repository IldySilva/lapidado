import 'package:lapidado/controllers/location_controller.dart';
import 'package:lapidado/controllers/network/Schedule.dart';
import 'package:lapidado/models/sheduleMark.dart';

class ISchedule {
  markSchedule(Schedule schedule) async {
    try {
      var currentLocation = await LocationController().getUserCurrentLocation();
      schedule.latitude = currentLocation?.latitude;
      schedule.longitude = currentLocation?.longitude;
      ScheduleController().markSchedule(schedule);
    } catch (e) {

      print("Não Foi Possível");
      print(e);

    }
  }
}
