import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/helpers/helpers.dart';
import 'package:lapidado/interfaces/schedule_interface.dart';

class MySchedule extends StatefulWidget {
  const MySchedule({Key? key}) : super(key: key);

  @override
  State<MySchedule> createState() => _MyScheduleState();
}

class _MyScheduleState extends State<MySchedule> {

  @override
  void initState() {
    ISchedule().getMySchedules();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: const Text("Minha Agenda",style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Obx(
                    () => controller.loadingSchedules.value
                        ? Center(
                            child: CircularProgressIndicator(
                            color: CustomColors().azul,
                          ))
                        : controller.listOfSchedules.isEmpty
                        ? Center(
                      child: Text("Não há marcações na sua agenda"),
                    )
                        :  SingleChildScrollView(
                            child: Column(
                              children: [
                                for (var c in controller.listOfSchedules)
                                  Card(
                                      child: Container(
                                    padding: EdgeInsets.only(
                                        left: Get.width * 0.1, right: 10),
                                    height: Get.height * .3,
                                    width: Get.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Data , Hora  e  Serviço ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        ListTile(
                                          title: Text(DateFormat("dd-MM-yyyy")
                                                  .format(
                                                DateTime.parse(c.createDate),
                                              ) +
                                              " | " +
                                              ( c.markedTime??"Indefinida").toString().replaceAll("TimeOfDay(", "").replaceAll(")", " Horas")),

                                          subtitle: Text(c.hairCutName +
                                              " | " +
                                              currencyConverter(
                                                  c.hairCutPrice)),
                                        ),
                                        Text(
                                          "Localização ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        ListTile(
                                          title: Text(c.locationDescription
                                                  .toString()
                                                  .isEmpty
                                              ? "Sua Localização no momento"
                                              : c.locationDescription
                                                  .toString()),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                          SizedBox(),
                                            TextButton(
                                                onPressed: () async {

                                                  await ISchedule().deleteSchedule(c);

                                                },
                                                child: Text(
                                                  "Eliminar",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                              ],
                            ),
                          ),
                  )));
  }
}
