import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/view/customWidgets/decoration.dart';

class CustomInput {
  textFields({label, controller}) {
    return Container(

      padding: EdgeInsets.only(left: Get.width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, boxShadow: CustomDecorations().shadows),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label ?? "Digite", border: InputBorder.none),
      ),
    );
  }

  numberFields({label, controller}) {
    return Container(

      padding: EdgeInsets.only(left: Get.width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, boxShadow: CustomDecorations().shadows),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
            labelText: label ?? "Digite", border: InputBorder.none),
      ),
    );
  }
}