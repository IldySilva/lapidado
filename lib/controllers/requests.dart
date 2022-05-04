import 'package:http/http.dart' as http;

class Requests {
  var endpoint;

  //final baseUrl="https://lapidadoapi.herokuapp.com/api/";
  //https://lapidadoapi.herokuapp.com/
 final baseUrl="http://10.0.2.2:8000/api/";
  Requests(this.endpoint);

  Future<http.Response> postRequest(dados) async {
    var response = await http.post(Uri.parse( baseUrl+ endpoint),body:(dados), headers: ({
    "content-type": "application/json",
    }),).timeout(Duration(seconds: 40));
    return response;
  }
  Future<http.Response> deleteRequest(documentId) async {
    var response = await http.delete(Uri.parse( baseUrl+ endpoint +"="+documentId), headers: ({
      "content-type": "application/json",
    }),).timeout(Duration(seconds: 30));
    return response;
  }

  Future<http.Response> getRequestWithId(id) async {
    var response = await http.get(Uri.parse( baseUrl+ endpoint +"="+id), headers: ({
      "content-type": "application/json",
    }),).timeout(Duration(seconds: 30));
    return response;
  }
  Future<http.Response> getRequest() async {
    var response = await http.get(Uri.parse( baseUrl+ endpoint), headers: ({
      "content-type": "application/json",
    }),).timeout(Duration(seconds: 30));
    return response;
  }

}
