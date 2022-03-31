import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lapidado/Constants/constants.dart';
class Dialogs{

  confirmLogout()async{

    return await showDialog(context: Get.context!, builder: (context){


      return AlertDialog(title: Text("Deseja Realmente Sair da Conta?"),actions: [

        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancelar"))
,
        TextButton(onPressed: (){
          Navigator.pop(context);
          controller.userIsLogged.value=false;
          GetStorage().erase();

        }, child: Text("Sim"))

      ],);

    });
  }

}