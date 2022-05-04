import 'package:get/get.dart';
import 'package:lapidado/controllers/network/profile_network/auth_controller.dart';
import 'package:lapidado/view/responses/responses.dart';

import '../controllers/network/profile_network/create_account.dart';

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

  deleteAccount()async{
    await  AuthController().deleteMyAccount();
  }
  editAcount(user)async {

    await AuthController().editAccount(user);
  }
}
