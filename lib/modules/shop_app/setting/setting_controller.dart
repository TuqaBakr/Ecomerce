import 'package:get/get.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';

class SettingController extends GetxController{
  MyServices myServices = Get.find();

  logout(){
    myServices.sharedPreferances.clear();
    Get.offAllNamed(AppRoute.loginShop);
  }
}