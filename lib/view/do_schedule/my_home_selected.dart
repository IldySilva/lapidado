import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';

class SelectedWayToShedule {
  onHomeSelected() {

    return Container(
      width: Get.width,
      child: Column(
        children: [
          Text("A Sua Localização será enviada e um barbeiro irá lhe atender")
        ],
      ),
    );
  }


  onOtherSelected() {
    return Card(
      child: Container(
          height: Get.height * 0.13,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.localDescController,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Descreva aonde o barbeiro irá encontra-lo",border: InputBorder.none),
            ),
          )),
    );
  }
}
