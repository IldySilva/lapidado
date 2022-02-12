import 'dart:convert';

import 'package:http/http.dart' as http;

class Requests {
  var endpoint;
  dynamic response;
  final baseUrl="http://10.0.2.2:8000/api/";

  Requests(this.endpoint);

  Future<http.Response> postRequest(user) async {
    response = await http.post(Uri.parse( baseUrl+ endpoint),body: json.encode(user), headers: ({
    "content-type": "application/json",
    "accept": "application/json"
    }));
    return response;
  }
}
