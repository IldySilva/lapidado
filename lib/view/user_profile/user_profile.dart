import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/Domain/Entities/user.dart';
import 'package:lapidado/interfaces/auth_interfaces.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/decoration.dart';
import 'package:lapidado/view/customWidgets/input.dart';

import 'package:url_launcher/url_launcher.dart' as launcher;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: Get.height,
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
User user=User();
                    controller.nameEditingController.text=controller.final_user.username;
                    controller.phoneEditingController.text=controller.final_user.phoneNumber;

                    await showDialog(context: context, builder: (context){

  return SimpleDialog(title: Text("Editar dados"),


  children: [
    CustomInput().textFields(
        label: "Nome de Utilizador",
        controller: controller.nameEditingController,
        icon: Icons.person_outlined),
    CustomDecorations().space(2),
    CustomInput().textFields(
        label: "Telefone",
        controller: controller.phoneEditingController,
        icon: Icons.phone_android,keys: TextInputType.phone),
    CustomDecorations().space(2),

    TextButton(onPressed: (){
      Navigator.pop(context);

    }, child: Text("Cancelar",)),
    CustomDecorations().space(2),

Padding(padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),child:     CustomButtons().mainButton(label:"Guardar",onPress: () async {

  user.username =
      controller.nameEditingController.text;
  user.phoneNumber =
      controller.phoneEditingController.text;
  await IAuth().editAcount(user);
setState((){});

}))

  ],
  );

});
                  },
                  leading: Icon(
                    Icons.edit,
                    color: CustomColors().azul,
                  ),
                  trailing: Icon(Icons.arrow_right),
                  title: Text("Editar Dados"),

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
                  subtitle: Text("Detalhes do Aplicativo"),
                )),

          Card(
                child: ListTile(
                  onTap: ()async {

                    await showDialog(context: context, builder: (context){
                      return SimpleDialog(
                        title: Text("Confirmação"),
                        contentPadding: EdgeInsets.all(12),
                        children: [

                          Text("Deseja realmente Eliminar a sua conta permamenentemente"),
                          SizedBox(height: 16,),

                          Text("Isto quer dizer que os seus dados serão eliminados sem a possibilidade de recuperação tanto de outros utilizadores quanto para os adminstradores de dados do aplicativo Lapidado",style: TextStyle(color: Colors.red,fontSize: 12),),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);

                            }, child: Text("Cancelar",)),
SizedBox(width: 8,),
                            TextButton(onPressed: ()async {


                              Navigator.pop(context);
                    await          IAuth().deleteAccount();

                            }, child: Text("Confirmar",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),))

                          ],)

                        ],
                      );
                    });
                  },
                  leading: Icon(
                    Icons.delete,
                    color: CustomColors().azul,
                  ),
                  trailing: Icon(Icons.arrow_right),
                  title: Text("Eliminar Conta"),
                )),
          Expanded(
              child: Container(),
          ),

          SizedBox(
              height: Get.height * 0.03,
          ),
        ]),
      ),
    ),
            )));
  }
}
