import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/Authentication/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lapidado',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen()
    );
  }
}

