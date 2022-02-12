import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';

import 'decoration.dart';

class CustomButtons {
  mainButton({label, onPress}) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors().vermelha,
          borderRadius: BorderRadius.circular(8),
          boxShadow: CustomDecorations().shadows),
      width: Get.width,
      height: Get.height * 0.08,
      child: TextButton(
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPress,
      ),
    );
  }

  secondButton({required label, onPress}) {
    return Container(
      decoration: BoxDecoration(

        border: Border.all(
          color: CustomColors().azul,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: Get.width,
      height: Get.height * 0.08,
      child: TextButton(
        child: Text(
          label,
          style: TextStyle(color: CustomColors().azul),
        ),
        onPressed: onPress,
      ),
    );
  }

  homeScreenButton({required label, onPress, icon}) {
    return InkWell(
      splashColor: CustomColors().vermelha,
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(color: CustomColors().azul,
            borderRadius: BorderRadius.circular(8),
            boxShadow: CustomDecorations().shadows),
        width: Get.width * 0.35,
        height: Get.height * .18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(icon ?? Icons.miscellaneous_services_rounded,
              color: Colors.white30,),
            SizedBox(height: Get.height * 0.02,),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
