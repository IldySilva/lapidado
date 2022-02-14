import 'dart:convert';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/requests.dart';
import 'package:lapidado/models/user.dart';
import 'package:lapidado/view/responses/responses.dart';

class AuthController{


dynamic login(phone,pwd)async {


try{
  controller.loading.setLoading();
  var response=await Requests("login").postRequest(jsonEncode({
    "password":pwd,
    "phoneNumber":phone
  }));
  if(response.statusCode==200){
    var user=User.fromJson(jsonDecode(response.body)["objeto"]);
    controller.final_user=user;
    controller.userIsLogged.value=true;

    controller.loading.disposeLoading();


  }else{
    controller.loading.disposeLoading();
    UIResponses().fail("Não foi possivel Acessar,Verifique os seus dados");
  }


}catch(e){
  controller.loading.disposeLoading();
print(e);
  UIResponses().fail("Não foi possivel Acessar,Erro Interno");

}

}



}