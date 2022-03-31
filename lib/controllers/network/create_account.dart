import 'dart:convert';
import 'dart:io';

import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/requests.dart';
import 'package:lapidado/view/responses/responses.dart';

import '../../viewController/controller.dart';

class CreateAccount {
  createAccount(user, context) async {
    try {
      controller.loading.showLoading(context);
      var response = await Requests("createAccount").postRequest(jsonEncode(user.toJson()));
      print(response.body);
      if (response.statusCode == 200) {
        controller.loading.disposeLoading();
        controller.loading.disposeLoading();
        UIResponses().sucess("Muito Bem,Conta criada com sucesso");
        resetController();
      } else {
        controller.loading.disposeLoading();
        UIResponses().fail("Falha ao Criar conta");
      }
    }
    on SocketException{
      controller.loading.disposeLoading();

      UIResponses().interneError();
    }
    catch (e) {
      controller.loading.disposeLoading();
print(e);
      UIResponses().fail("Erro interno");
    }
  }
}
