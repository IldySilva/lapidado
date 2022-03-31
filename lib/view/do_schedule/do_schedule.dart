import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/enums.dart';
import 'package:lapidado/interfaces/schedule_interface.dart';
import 'package:lapidado/models/sheduleMark.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/input.dart';
import 'package:lapidado/view/do_schedule/my_home_selected.dart';

import '../../helpers/helpers.dart';

class DoSchedule extends StatefulWidget {
  const DoSchedule({Key? key}) : super(key: key);

  @override
  _DoScheduleState createState() => _DoScheduleState();
}

class _DoScheduleState extends State<DoSchedule> {
  var whereSelected = whereSchedule.myhome;
  TextEditingController selectedDateController=TextEditingController();
  TextEditingController selectedTimeController=TextEditingController();

  Schedule marking=Schedule();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(


          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width*0.8,
                          child: Text(
                            "Agendar Corte de Cabelo",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(8)),
                      width: Get.width * 0.43,
                      child: CustomInput().textFields(label: "Data",controller: selectedDateController),
                    ),
                    TextButton(
                        onPressed: ()async {
                       var data=   await showDatePicker(

                           context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2023));
if(data!=null) {
  marking.markedDate=data.toIso8601String();
  selectedDateController.text=DateFormat("dd-MM-yyy").format(data);

}
                        },
                        child: Text(
                          "Selecionar Data",
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(8)),

                      width: Get.width * 0.43,
                      child: CustomInput().textFields(label: "Horário",controller: selectedTimeController),
                    ),
                    TextButton(
                        onPressed: () async{
                          var time=await showTimePicker(context: context, initialTime: TimeOfDay.now());
if(time!=null) marking.markedTime=time.toString();
selectedTimeController.text=time!.format(context);
                        },
                        child: Text(
                          "Selecionar Hora",
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),  SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "CUSTO DO SERVIÇO:",
                ),
                Text(
                  currencyConverter(controller.selectedHaircut.price,),
                  style: TextStyle(
                      color: Colors.greenAccent, fontSize: 28),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
             Wrap(children: [
               RadioListTile<whereSchedule>(
                   title: Text("Aqui onde estou"),
                   value: whereSchedule.myhome,
                   groupValue: whereSelected,
                   onChanged: (v) {
                     setState(() {
                       whereSelected = v!;
                     });
                   }),
               RadioListTile<whereSchedule>(
                   title: Text("Outro"),
                   value: whereSchedule.other,
                   groupValue: whereSelected,
                   onChanged: (v) {
                     setState(() {
                       whereSelected = v!;
                     });
                   }),

             ],),

                if(whereSelected==whereSchedule.myhome) SelectedWayToShedule().onHomeSelected(),
                if(whereSelected==whereSchedule.other)SelectedWayToShedule().onOtherSelected(),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                  CustomButtons().mainButton(label: "Agendar",onPress: (){
                    marking.whereIs=whereSelected.toString();
                    marking.locationDescription= controller.localDescController.text;
                    marking.hairCutName=controller.selectedHaircut.name;
                    marking.hairCutDesc=controller.selectedHaircut.description;
                    marking.hairCutPrice=controller.selectedHaircut.price;
                    marking.hairCutId=controller.selectedHaircut.id;
                    if(selectedDateController.text.isNotEmpty && selectedTimeController.text.isNotEmpty)
                    ISchedule().markSchedule(marking);
                    else Get.rawSnackbar(message: "Indique uma data e hora",backgroundColor: Colors.red);
                  }),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                CustomButtons().secondButton(label: "Cancelar",onPress: ()=>Navigator.pop(context))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
