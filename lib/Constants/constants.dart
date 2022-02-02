import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lapidado/controllers/viewController/controller.dart';

class CustomColors{

  Color get vermelha=> Color(0xffAA3100);
  Color get azul=> Color(0xff002E4C);


}

Controller controller=Get.put(Controller());

class HelpersFuntions{

  String imageToBase64(bytes){
    return base64Encode(bytes);
  }

}