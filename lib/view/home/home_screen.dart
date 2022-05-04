import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/interfaces/hair_cuts_interface.dart';
import 'package:lapidado/interfaces/schedule_interface.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/models/haircut.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/decoration.dart';
import 'package:lapidado/view/do_schedule/do_schedule.dart';
import 'package:lapidado/view/home/dialogs.dart';
import 'package:lapidado/view/user_profile/user_profile.dart';

import '../MySchedules/my_schedules.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool selectedHair = false;
  Haircut selectedHairCut=Haircut();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          backgroundColor: Colors.white,
      key: scaffoldKey,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .07),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("LAPIDADO",style: TextStyle(color: Colors.black87),),
                  ImageIcon(AssetImage("assets/01.png",),size: 70,)
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * .07),

                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: CustomDecorations().shadows),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Olá\n${controller.final_user.username ?? "Camarada"}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 27,
                                    color: CustomColors().vermelha),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            "Bora Lapidar...",
                            style: TextStyle(color: CustomColors().azul),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),


                Container(height: Get.height*.4,width: Get.width,color: Colors.grey,

                    child:
                GoogleMap(
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    trafficEnabled: false,
                    onMapCreated: (c) {
                      controller.mapController = c;
                    },
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(controller.final_user.latitude,
                            controller.final_user.longitude),
                        tilt: 18,
                        zoom: 18)),
                ),
                SizedBox(height: Get.height*0.04,),
                Container(
                  width: Get.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomButtons().homeScreenButton(
                            label: "Chamar Barbeiro",
                            icon: Icons.campaign_sharp,
                            onPress: () async {
                              await _selectHairCut(context);
                              if (selectedHair == true)
                                await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        title: Text("Chamar Barbeiro"),
                                        contentPadding: EdgeInsets.zero,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
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
                                              style: TextStyle(
                                                  color: Colors.red),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          Container(
                                            width: Get.width,
                                            color: CustomColors().azul,
                                            child: TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  Call call = Call();

                                                  call.clientId = controller
                                                      .final_user.id;
                                                  await ISchedule()
                                                      .callBarber(call);
                                                },
                                                child: const Text(
                                                  "Confirmar",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ],
                                      );
                                    });
                            }),
                        CustomButtons().homeScreenButton(
                          label: "Agendar",
                          icon: Icons.schedule,
                          onPress: () async {
                            await _selectHairCut(context);
                            if (selectedHair == true) {
                              Get.to(DoSchedule());
                            } else {
                              print(selectedHair);
                            }
                          },
                        ),
                        CustomButtons().homeScreenButton(
                          label: "Agendadamentos",
                          icon: Icons.calendar_today,
                          onPress: () async {
                            Get.to(MySchedule());
                          },
                        ),
                        CustomButtons().homeScreenButton(
                            label: "Perfil",
                            icon: Icons.person,
                            onPress: () => Get.to(UserProfileScreen())),
                        CustomButtons().homeScreenButton(
                            label: "Terminar Sessão",
                            onPress: () => Dialogs().confirmLogout(),
                            icon: Icons.logout),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  _selectHairCut(context) async {
    var listOfHairCuts = await IHairCuts().fetchListOfHaircuts();
    await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Selecine o corte desejado"),
            children: [
              for (var cut in listOfHairCuts)
                Card(
                  child: ListTile(
                    onTap: () {
                      controller.selectedHaircut = cut;
                      Navigator.pop(context);
                      selectedHair = true;

                    },
                    title: Text(cut.name + " - "+cut.price.toString() + " AOA"),
                    subtitle: Text(cut.description??"Sem Descrição"),
                  ),
                ),
              TextButton(
                  onPressed: () {
                    print(selectedHair);
                    selectedHair = false;

                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"))
            ],
          );
        });
  }
}
