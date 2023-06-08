import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/routes.dart';

abstract  class successResetController extends GetxController{
   goToPageLogin();
}
class successResetControllerImp extends successResetController {

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  @override

  goToPageLogin() {
    var formdata = fromstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.loginShop);
    }
    else{
      print("Not Valid");
    }
  }
}