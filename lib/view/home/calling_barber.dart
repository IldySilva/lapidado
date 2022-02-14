import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/interfaces/schedule_interface.dart';
import 'package:lapidado/models/call.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lottie/lottie.dart';

class CallingBarber extends StatelessWidget {
  CallingBarber(this.call);

  var call = Call();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              child: GoogleMap(
                  onMapCreated: (c) {
                    controller.mapController = c;
                  },
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(call.clientLatitude, call.clientLongitude),
                      tilt: 18,
                      zoom: 18)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  height: Get.height * 0.3,
                  child: Lottie.asset(
                    'assets/lotties/looking.json',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: Get.width,
                  color: CustomColors().azul.withOpacity(0.9),
                  height: Get.height * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: Get.width * 0.4,
                            child: Text(
                              "Estamos a procura do melhor para sí",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        call.answered == false
                            ? Text("Ainda Sem Resposta")
                            : Card(
                                child: ListTile(
                                  subtitle: Text("Barber Description"),
                                  title: Text(
                                    "Barber Name",
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.message,
                                      color: CustomColors().vermelha,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        Text(
                          "CUSTO DO SERVIÇO:",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "4,000,O0 AOA",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 28),
                        ),
                        SizedBox(
                          height: Get.height * 0.02 ,
                        ),
                        Text(
                          "Total a Pagar:",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "4,500,O0 AOA",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 28),
                        ),
                        Expanded(child: Container()),
                        CustomButtons()
                            .secondButton(label: "Cancelar", onPress: () {
                          ISchedule().cancellCall(call.id);

                          Navigator.pop(context);

                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
