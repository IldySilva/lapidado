import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIResponses{

  sucess(message){

    return Get.rawSnackbar(message: message,backgroundColor: Colors.green,duration: Duration(seconds: 8));

  }
  fail(message){
    return Get.rawSnackbar(message: message,backgroundColor: Colors.red);


  }
  interneError(){

    return Get.rawSnackbar(message: "Falha,Verifique a sua conexão a internet",backgroundColor: Colors.red);

  }
}