import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/interfaces/schedule_interface.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/view/Authentication/login_screen.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/input.dart';
import 'package:lapidado/view/do_schedule/do_schedule.dart';
import 'package:lapidado/view/home/dialogs.dart';
import 'package:lapidado/view/user_profile/user_profile.dart';

import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [CustomColors().azul, Colors.white30],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Olá\n${controller.final_user.username}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                CustomInput().textFields(label: "procurar"),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [

                    CustomButtons().homeScreenButton(
                        label: "Chamar Barbeiro",
                        icon: Icons.campaign_sharp,
                        onPress: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: Text("Chamar Barbeiro"),
                                  contentPadding: EdgeInsets.zero,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Os seus dados(Localização,nome e numero de telefone) serão enviados ao nosso sistema.\n\nDesse jeito os Barbeiros que estiverem disponiveis irão atender o seu pedido e entrar em contacto",
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    Container(
                                      width: Get.width,
                                      color: CustomColors().azul,
                                      child: TextButton(
                                          onPressed: () async {
                                            Call call=Call();
                                            call.clientId=controller.final_user.id;
                                            print(call.toJson());
                                            await  ISchedule().callBarber(call);

                                          },
                                          child: Text(
                                            "Confirmar",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                );
                              });
                        }),
                    CustomButtons().homeScreenButton(
                        label: "Meu Perfil",
                        icon: Icons.person,
                        onPress: () => Get.to(UserProfileScreen())),
                    CustomButtons().homeScreenButton(label: "Definições"),
                    CustomButtons().homeScreenButton(
                        label: "Terminar Sessão",
                        onPress: () => Dialogs().confirmLogout(),
                        icon: Icons.logout),
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
