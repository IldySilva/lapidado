import 'package:location/location.dart';
class LocationController{
 Location location=Location();

  getUserLocation()async{

var loc= await location.getLocation();
print(loc.longitude);
return loc;

  }

}