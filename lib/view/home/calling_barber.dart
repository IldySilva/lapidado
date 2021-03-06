import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/network/FirebaseNetwork.dart';
import 'package:lapidado/helpers/helpers.dart';
import 'package:lapidado/interfaces/schedule_interface.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/view/chat/chatScreen.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lottie/lottie.dart';

class CallingBarber extends StatefulWidget {
  CallingBarber(this.call);

  var call = Call();

  @override
  _CallingBarberState createState() => _CallingBarberState();
}

class _CallingBarberState extends State<CallingBarber> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var selectedWayToPay = "Dinheiro";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: StreamBuilder<Call>(
        initialData: Call(),
        stream: FirebaseNetwork().getCall(widget.call),
        builder: (context,data){
Call streamCall=data.data!;
        return Container(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height*0.26,

                child:   Stack(children: [
                  GoogleMap(
                      onMapCreated: (c) {
                        controller.mapController = c;
                      },
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(streamCall.clientLatitude,
                              streamCall.clientLongitude),
                          tilt: 18,
                          zoom: 18)),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Container(
                    height: Get.height * 0.26,
                    child: Lottie.asset(
                      'assets/lotties/looking.json',
                      fit: BoxFit.fill,
                    ),
                  ),

                ],),
              ),

              Container(
                width: Get.width,
                height: Get.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: Get.width * 0.6,
                          child: Text(
                            "Estamos a procura do melhor para s??",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      streamCall.answered == false
                          ? Row(
                        children: [
                          Icon(Icons.search, color: Colors.green),
                          Text(
                            "Ainda Sem Resposta",
                            style: TextStyle(  color: Colors.black54),
                          ),
                        ],
                      )
                          : Card(
                        child: ListTile(
                          subtitle: Text("o seu pedido foi atendido\nClique o no icone  ao lado e converse com o Barbeiro :)"),
                          title:
                          Text(streamCall.barberName ?? "Unnamed"),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.message,
                              color: CustomColors().vermelha,
                            ),
                            onPressed: () {
                              Get.off(ChatScreen(streamCall));
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Text(
                        "CUSTO DO SERVI??O:",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        currencyConverter(
                          controller.selectedHaircut.price,
                        ),
                        style: TextStyle(
                            color: Colors.green, fontSize: 28),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),

                      Expanded(child: Container()),
                      CustomButtons().mainButton(
                          label: "Cancelar",
                          onPress:() {
                            Navigator.pop(context);
                            ISchedule().cancellCall(widget.call.id);
                          }
                      ),

                    ],
                  ),
                ),
              ),


            ],
          ),
        );

      },)
    ));
  }
}
