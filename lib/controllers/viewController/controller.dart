import 'package:get/get.dart';
import 'package:flutter/material.dart';
class Controller extends GetxController{

  //Controllers For TextFields
  TextEditingController phoneEditingController=TextEditingController();
  TextEditingController pwdEditingController=TextEditingController();
  TextEditingController locationEditingController=TextEditingController();
  TextEditingController nameEditingController=TextEditingController();
  TextEditingController localDescController=TextEditingController();

  RxBool imageIsSelected=false.obs;
  RxString base64ImageSelected="".obs;

}