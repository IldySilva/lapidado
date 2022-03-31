import 'package:get_storage/get_storage.dart';

class CacheController{


  saveData(key,data)async {
  await  GetStorage().write(key, data);
  }


}