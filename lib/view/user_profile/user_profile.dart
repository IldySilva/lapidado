import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [CustomColors().azul, Colors.white30],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
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
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          CircleAvatar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/03.png",
              ),
            ),
            radius: Get.height * 0.06,
          )
,
          SizedBox(height: Get.height*0.03,),
          Text(controller.final_user.username,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: Get.height*0.03),),
          SizedBox(height: Get.height*0.02,),

          SizedBox(height: Get.height*0.03,),
          Card(child: ListTile(leading: Icon(Icons.location_on,color: CustomColors().azul,),title: Text(controller.final_user.location??"Indefinida"),subtitle: Text("Residência"),)),
          Card(child: ListTile(leading: Icon(Icons.done,color: CustomColors().azul,),title: Text("0"),subtitle: Text("Agendas Concluidas"),))
       ,   Card(child: ListTile(leading: Icon(Icons.phone_android_rounded,color: CustomColors().azul,),title: Text(controller.final_user.phoneNumber),subtitle: Text("Telefone"),))
,Expanded(child: Container(),)
          ,  TextButton(onPressed: (){}, child: Text("Editar Dados",style: TextStyle(color: Colors.black),)),SizedBox(height: Get.height*0.03,),
        ]),
      ),
    )));
  }
}
