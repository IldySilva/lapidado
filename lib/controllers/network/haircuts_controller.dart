import 'dart:convert';

import 'package:lapidado/Constants/api_controller.dart';
import 'package:lapidado/Constants/constants.dart';
import 'package:lapidado/controllers/requests.dart';
import 'package:lapidado/models/haircut.dart';
import 'package:lapidado/view/responses/responses.dart';

class HairCutsController {
  dynamic fetchHairCuts() async {
    controller.loading.setLoading();
    var list=[];
    var response = await Requests("getCuts").getRequest();
    print(response.body);
    if (response.statusCode == 200) {
      var json=jsonDecode(response.body);
      for(var cut in json["object"])
        list.add(Haircut.fromJson(cut));
    }

    else {
      UIResponses().fail("Falha ao carregar cortes");
    }

    controller.loading.disposeLoading();
    return list;

  }
}
