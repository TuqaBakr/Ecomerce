import 'package:get/get.dart';
import 'package:weam/services/services.dart';

TranslationDataBase(Columnar, Columnen){
  MyServices myServices = Get.find() ;

  if(myServices.sharedPreferances.getString("lang") == "ar"){
    return Columnar ;
  } else{
    return Columnen ;
  }


}