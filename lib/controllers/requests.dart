import 'dart:convert';

import 'package:http/http.dart' as http;

class Requests {
  var endpoint;

  final baseUrl="http://10.0.2.2:8000/api/";

  Requests(this.endpoint);

  Future<http.Response> postRequest(dados) async {
    var response = await http.post(Uri.parse( baseUrl+ endpoint),body:(dados), headers: ({
    "content-type": "application/json",
    }),).timeout(Duration(seconds: 30));
    return response;
  }
}
