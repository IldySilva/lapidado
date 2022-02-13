import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/models/user.dart';
import 'package:lapidado/view/loading/loading.dart';
class Controller extends GetxController{

  //Controllers For TextFields
  TextEditingController phoneEditingController=TextEditingController();
  TextEditingController pwdEditingController=TextEditingController();
  TextEditingController locationEditingController=TextEditingController();
  TextEditingController nameEditingController=TextEditingController();
  TextEditingController localDescController=TextEditingController();

  RxBool imageIsSelected=false.obs;
  RxString base64ImageSelected="".obs;
  RxBool userIsLogged=false.obs;

  Loading loading=Loading();

  User final_user=User();

}
resetController(){
  controller.locationEditingController.clear();
controller.nameEditingController.clear();
controller.localDescController.clear();

}