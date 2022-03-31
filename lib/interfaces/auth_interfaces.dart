import 'package:get/get.dart';
import 'package:lapidado/controllers/network/auth_controller.dart';
import 'package:lapidado/controllers/network/create_account.dart';
import 'package:lapidado/view/responses/responses.dart';

class IAuth {
  tryLogin(String phone, String pwd) {
    if (phone.isNotEmpty && pwd.isNotEmpty)
      AuthController().login(phone, pwd);
    else
      UIResponses().fail("Preencha os Dados de Acesso");
  }

  createAccount(user) async {
    await CreateAccount().createAccount(user, Get.context);
  }
}
