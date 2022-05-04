import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/location.dart';
import 'package:lapidado/controllers/requests.dart';
import 'package:lapidado/Domain/Entities/user.dart';
import 'package:lapidado/view/authentication/login_screen.dart';
import 'package:lapidado/view/responses/responses.dart';

class AuthController{

dynamic login(phone,pwd)async {


try{
  controller.loading.setLoading();
  var response=await Requests("login").postRequest(jsonEncode({
    "password":pwd,
    "phoneNumber":phone
  }));
  print(response.body);
  if(response.statusCode==200){
    var user=User.fromJson(jsonDecode(response.body)["object"]);
    controller.final_user=user;
    var loc=await LocationController().getUserLocation();
    controller.final_user.latitude=loc.latitude;
    controller.final_user.longitude=loc.longitude;
    controller.userIsLogged.value=true;
    GetStorage().write("user", controller.final_user.toJson());
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
dynamic deleteMyAccount()async{

  try{
    controller.loading.setLoading();
    var response=await Requests("deleteMyAccount?userId=").deleteRequest(controller.final_user.id);
    print(response.body);
    if(response.statusCode==200){
      controller.userIsLogged.value=false;
      controller.loading.disposeLoading();
      Get.to(LoginScreen());
      GetStorage().erase();
    }else{
      controller.loading.disposeLoading();
      UIResponses().fail("Não foi possivel Concluir");
    }


  }catch(e){
    controller.loading.disposeLoading();
    UIResponses().fail("Não foi possivel Acessar,Erro Interno");

  }

}
editAccount(user)async {
  try{
    controller.loading.setLoading();
    var response=await Requests("EditAccount").postRequest(jsonEncode({
        "userId": controller.final_user.id,
        "username": user.username,
        "phoneNumber": user.phoneNumber,
    }));
    print(response.body);
    if(response.statusCode==200){
      var user=User.fromJson(jsonDecode(response.body)["object"]);
      controller.final_user=user;
      GetStorage().write("user", controller.final_user.toJson());
      controller.loading.disposeLoading();
      Navigator.pop(Get.context!);


    }else{
      controller.loading.disposeLoading();
      UIResponses().fail("Não foi possivel Concluir,Verifique os seus dados");
    }


  }catch(e){
    controller.loading.disposeLoading();
    print(e);
    UIResponses().fail("Não foi possivel Acessar,Erro Interno");

  }

}

}