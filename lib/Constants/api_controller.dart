
import 'package:http/http.dart'as http;
class ApiController{
  var baseUrl="https://lapidadoapi.herokuapp.com/api";
  Future<dynamic>get(route)async{

    var response=await http.get(Uri.parse(baseUrl+route));
    return response;
  }
  Future<dynamic>post(route,data)async{

    var response=await http.post(Uri.parse(baseUrl+route),body:data);
    return response;
  }

}