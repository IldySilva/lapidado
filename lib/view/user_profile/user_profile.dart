import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';

import 'package:url_launcher/url_launcher.dart' as launcher;

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: Get.width,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
        child: Column(children: [
          SizedBox(
            height: Get.height * 0.1,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black,),borderRadius: BorderRadius.circular(100)),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/03.png",
                ),
              ),
              radius: Get.height * 0.06,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Text(
            controller.final_user.username,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: Get.height * 0.03),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.location_on,
              color: CustomColors().azul,
            ),
            title: Text(controller.final_user.location ?? "Indefinida"),
            subtitle: Text("Residência"),
          )),

          Card(
              child: ListTile(
            leading: Icon(
              Icons.phone_android_rounded,
              color: CustomColors().azul,
            ),
            title: Text(controller.final_user.phoneNumber),
            subtitle: Text("Telefone"),
          )),

          Card(
              child: ListTile(
                onTap: ()async {
                  if(await launcher.canLaunch("https://lapidado.com/privacy.html"))
             await       launcher.launch("https://lapidado.com/privacy.html");

                },
                leading: Icon(
                  Icons.info,
                  color: CustomColors().azul,
                ),
                trailing: Icon(Icons.arrow_right),
                title: Text("Termos & Condições"),
                subtitle: Text("Detalhes do Apicativo"),
              )),
          Expanded(
            child: Container(),
          ),

          SizedBox(
            height: Get.height * 0.03,
          ),
        ]),
      ),
    )));
  }
}
