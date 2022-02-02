import 'package:lapidado/controllers/network/auth_controller.dart';

class IAuth{

tryLogin(phone,pwd){
AuthController().login(phone,pwd);

  }


}