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
      } else {
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
      var response = await Requests("callBarber")
          .postRequest(jsonEncode(call.toJson()));


      if (response.statusCode == 200) {
        controller.loading.disposeLoading();
        call.id = jsonDecode(response.body)["id"];
        print(jsonDecode(response.body));
        print(call.id);
        call.answered = false;
        Get.to(CallingBarber(call));
      } else {
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
      var response = await Requests("cancelBarberCall?callId")
          .deleteRequest(id);

      print(response.body);
      if (response.statusCode == 200) {
        UIResponses().sucess("Você cancelou a chamada");
        print("Remoção bem sucedida");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  dynamic getCall(call) async {
    try {
      var response = await Requests("getCall?callId")
          .getRequestWithId(call.id);
      if (response.statusCode == 200) {
        print("bem sucedido");
        var c = Call.fromJson(jsonDecode(response.body)["objeto"]);
        print(c.answered);
        return c;
      } else {
        print(response.statusCode);
        return call;
      }
    } catch (e) {
      print("erro");
      print(e);
      return call;
    }
  }

  dynamic getmySchedules() async {
    try {
      controller.listOfSchedules.clear();
      controller.loadingSchedules.value = true;

      print("getting schedules");
      var response = await Requests(
          "getMySchedules?userId=${controller.final_user.id}")
          .getRequest();
      if (response.statusCode == 200) {
        print(response.body);
        print("bem sucedido");
        var json = jsonDecode(response.body)["object"];
        for (var i in json) {
          var schedule = Schedule.fromJson(i);
          controller.listOfSchedules.add(schedule);
        }
        controller.loadingSchedules.value = false;
      } else {
        print(response.statusCode);
        controller.listOfSchedules.clear();

        controller.loadingSchedules.value = false;
      }
    } catch (e) {
      print(e);
      controller.listOfSchedules.clear();
      controller.loadingSchedules.value = false;
    }
  }

  deleteSchedule(Schedule schedule) async {
    print("deletting..");
    controller.loadingSchedules.value=true;
    var response = await Requests("deleteSchedule?scheduleId")
        .deleteRequest(schedule.id);
    print(response.body);
    if (response.statusCode == 200) {

      UIResponses().sucess("Registo Apagado com sucesso");
      getmySchedules();
    }else{
      print("Error");
      UIResponses().fail("Não foi possivel Concluir a acção,erro interno");
      controller.loadingSchedules.value=false;

    }
  }
}
