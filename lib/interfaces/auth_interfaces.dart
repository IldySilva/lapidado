

import 'package:get/get.dart';
import 'package:lapidado/controllers/network/auth_controller.dart';
import 'package:lapidado/controllers/network/create_account.dart';

class IAuth {
  tryLogin(phone, pwd) {
    AuthController().login(phone, pwd);
  }

  createAccount(user) async{
      await  CreateAccount().createAccount(user,Get.context);
  }
}
