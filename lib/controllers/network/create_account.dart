import 'dart:io';

import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/requests.dart';
import 'package:lapidado/view/responses/responses.dart';

class CreateAccount {
  createAccount(user, context) async {
    try {
      controller.loading.showLoading(context);
      var response = await Requests("createAccount").postRequest(user.toJson());
      print(response.body);
      if (response.statusCode == 200) {
        controller.loading.disposeLoading(context);
        controller.loading.disposeLoading(context);
        UIResponses().sucess("Maravilha,Conta criada com sucesso");
      } else {
        controller.loading.disposeLoading(context);

        UIResponses().sucess("Falha ao Criar conta");
      }
    }
    on SocketException{
      UIResponses().interneError();
    }
    catch (e) {
      controller.loading.disposeLoading(context);

      UIResponses().sucess("Erro interno");
    }
  }
}
