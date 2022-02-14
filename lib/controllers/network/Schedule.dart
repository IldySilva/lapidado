import 'dart:convert';

import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/requests.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/models/sheduleMark.dart';
import 'package:lapidado/view/home/calling_barber.dart';
import 'package:lapidado/view/responses/responses.dart';

class ScheduleController {
  markSchedule(Schedule schedule) async {
    try {
      print(schedule.toJson());
      var response = await Requests("markSchedule")
          .postRequest(jsonEncode(schedule.toJson()));

      print(response.body);
      if (response.statusCode == 200) {
        controller.loading.disposeLoading();
        controller.loading.disposeLoading();


        UIResponses().sucess(
            "Muito Bem,Acabaste de Agendar uma prestação de serviço,um dos Barbeiros Disponiveis irá entrar em Contacto");
      }else{
        controller.loading.disposeLoading();

        UIResponses().fail("Não foi possivel Efectuar o seu pedido");
      }
    } catch (e) {
      controller.loading.disposeLoading();
      print(e);
    }
  }
dynamic callBarber(Call call) async {
    try {
      print(call.toJson());
      var response = await Requests("callBarber")
          .postRequest(jsonEncode(call.toJson()));

      print(response.body);
      if (response.statusCode == 200) {

        controller.loading.disposeLoading();
        controller.loading.disposeLoading();
        call.id= jsonDecode(response.body)["id"];
        Get.to(CallingBarber(call));
      }else{
        controller.loading.disposeLoading();
        UIResponses().fail("Não foi possivel Efectuar o seu pedido");
      }
    } catch (e) {
      controller.loading.disposeLoading();
      print(e);
    }
  }
  cancelCallBarber(id) async {
    try {

      var response = await Requests("cancelBarberCall")
          .deleteRequest(id);

      print(response.body);
      if (response.statusCode == 200) {

      }else{

      }
    } catch (e) {
      print(e);
    }
  }
}
