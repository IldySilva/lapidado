import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/location_controller.dart';
import 'package:lapidado/controllers/network/Schedule.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/models/sheduleMark.dart';

class ISchedule {
  markSchedule(Schedule schedule) async {
    try {
      controller.loading.setLoading();
      var currentLocation = await LocationController().getUserCurrentLocation();
      schedule.latitude = currentLocation?.latitude;
      schedule.longitude = currentLocation?.longitude;
      schedule.clientId=controller.final_user.id;
      await ScheduleController().markSchedule(schedule);
    } catch (e) {

      controller.loading.disposeLoading();
      print(e);

    }
  }

  dynamic callBarber(Call call)async{
    try {
      controller.loading.setLoading();
      var currentLocation = await LocationController().getUserCurrentLocation();
      call.clientLongitude=currentLocation?.longitude;
      call.clientLatitude=currentLocation?.latitude;
      call.clientPhoneNumber=controller.final_user.phoneNumber;

     await ScheduleController().callBarber(call);
    } catch (e) {
      controller.loading.disposeLoading();


      print(e);

    }


  }
  cancellCall(id) async {
    try {

      await ScheduleController().cancelCallBarber(id);} catch (e) {
      print(e);

    }

  }
  getCall(call) async {
    try {

     return  await ScheduleController().getCall(call);} catch (e)
    {
      print(e);

    }

  }
  getMySchedules() async {
    try {
      return await ScheduleController().getmySchedules();
    } catch (e) {
      print(e);
    }
  }
    deleteSchedule(Schedule schedule) async {
      try {

        return  await ScheduleController().deleteSchedule(schedule);} catch (e)
      {
        print(e);

      }


    }
}
