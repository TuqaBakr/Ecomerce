import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/services/services.dart';

class HomeController extends GetxController{


}

class HomeControllerImp extends HomeController{

  late TextEditingController search;

  MyServices myServices = Get.find() ;

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }


}