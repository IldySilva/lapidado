import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/input.dart';
import 'package:lapidado/view/do_schedule/do_schedule.dart';

import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


var scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          key: scaffoldKey,
          drawer: CustomDrawer(),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [CustomColors().azul,Colors.white30],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
            child: Column(
              children: [
               Column(children: [
               SizedBox(
                 height: Get.height * 0.04,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Olá\nDácio da Costa",
                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25,color: Colors.white),
                   ),
                   IconButton(onPressed: () {

                     scaffoldKey.currentState!.openDrawer();

                   }, icon: Icon(Icons.menu,color: Colors.white,))
                 ],
               ),
               ],),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Divider(color: Colors.white,),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                CustomInput().textFields(label: "procurar"),


                SizedBox(
                  height: Get.height * 0.04,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    CustomButtons().homeScreenButton(label: "Agendar",onPress: ()=>Get.to(DoSchedule())),
                    CustomButtons().homeScreenButton(label: "Chamar Barbeiro"),
                    CustomButtons().homeScreenButton(label: "Ver Barbearias"),
                    CustomButtons().homeScreenButton(label: "Outras Opções"),


                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
