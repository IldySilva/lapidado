import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/models/user.dart';
import 'package:lapidado/view/home/home_screen.dart';

import 'view/Authentication/login_screen.dart';

 main() async {

  await GetStorage.init();

  if (Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  if(  GetStorage().hasData("notNewUser"))
    controller.firstTime.value=false;
  if(GetStorage().hasData("user")){
    controller.final_user=User.fromJson(GetStorage().read("user"));
    controller.userIsLogged.value=true;

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lapidado',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Obx(() =>
            controller.userIsLogged.value ? HomeScreen() : LoginScreen()));
  }
}
