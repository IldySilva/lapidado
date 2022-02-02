import 'dart:convert';

import 'package:http/http.dart' as http;

class Requests {
  var endpoint;
  dynamic response;

  Requests({this.endpoint});

  Future<dynamic> postRequest() async {
    response = await http.post(Uri.parse(endpoint));
    response=jsonDecode(response.body);
    return response;
  }
}
