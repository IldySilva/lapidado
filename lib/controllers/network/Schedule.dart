import 'package:lapidado/controllers/requests.dart';
import 'package:lapidado/models/sheduleMark.dart';

class ScheduleController{


markSchedule(Schedule schedule)async {
try{
 print(schedule.toJson());
 var response=await Requests(endpoint: "null").postRequest();


}catch(e){



}

}



}