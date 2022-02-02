import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/enums.dart';
import 'package:lapidado/interfaces/schedule_interface.dart';
import 'package:lapidado/models/sheduleMark.dart';
import 'package:lapidado/view/customWidgets/buttons.dart';
import 'package:lapidado/view/customWidgets/input.dart';
import 'package:lapidado/view/do_schedule/my_home_selected.dart';

class DoSchedule extends StatefulWidget {
  const DoSchedule({Key? key}) : super(key: key);

  @override
  _DoScheduleState createState() => _DoScheduleState();
}

class _DoScheduleState extends State<DoSchedule> {
  var whereSelected = whereSchedule.myhome;
  Schedule marking=Schedule();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                          "Agendar Corte de Cabelo",
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
                      width: Get.width * 0.43,
                      child: CustomInput().textFields(label: "Data"),
                    ),
                    TextButton(
                        onPressed: ()async {
                       var data=   await showDatePicker(

                           context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2023));
if(data!=null) marking.markedDate=data.toIso8601String();

                        },
                        child: Text(
                          "Selecionar Data",
                          style: TextStyle(
                              color: Colors.white,
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
                      width: Get.width * 0.43,
                      child: CustomInput().textFields(label: "Horário"),
                    ),
                    TextButton(
                        onPressed: () async{
                          var time=await showTimePicker(context: context, initialTime: TimeOfDay.now());
if(time!=null) marking.markedTime=time.toString();
                        },
                        child: Text(
                          "Selecionar Hora",
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),  SizedBox(
                  height: Get.height * 0.02,
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
                    ISchedule().markSchedule(marking);
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
