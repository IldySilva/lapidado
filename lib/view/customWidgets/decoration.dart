import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDecorations{
List<BoxShadow> shadows=[ BoxShadow(
    color: Colors.grey.withOpacity(0.1), blurRadius: 3, spreadRadius: 2), BoxShadow(
    color: Colors.grey.withOpacity(0.3), blurRadius: 3, spreadRadius: -3)];

space(height){

  return SizedBox(height: Get.height*height/100,);
}
}