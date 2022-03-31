import 'package:lapidado/controllers/network/haircuts_controller.dart';

class IHairCuts{

 dynamic  fetchListOfHaircuts(){
   try{
     return HairCutsController().fetchHairCuts();

   }on Exception catch(e){


     return [];
   }

  }


}