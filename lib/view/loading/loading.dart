import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading{


  showLoading(context){

    return  showDialog(
        barrierColor: Colors.grey.withOpacity(0.7),
        context: context, builder: (context){

      return BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Center(child: CircularProgressIndicator(color: Colors.white,),));

    });
  }

  setLoading()=>showLoading(Get.context);
  disposeLoading()=>Navigator.pop(Get.context!);

}