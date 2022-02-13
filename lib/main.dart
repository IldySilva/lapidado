import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/view/home/home_screen.dart';

import 'view/Authentication/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
