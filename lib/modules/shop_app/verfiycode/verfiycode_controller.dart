import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class verfiycodeController extends GetxController{
  checkCode();
  goToresetPassword();
}

class  verfiycodeControllerImp extends verfiycodeController {
  late String verfiycode;

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();


  @override
  checkCode() {
    var formdata = fromstate.currentState;
    if(formdata!.validate()){
      print("Valid");
    }
    else{
      print("Not Valid");
    }
  }


  @override
  goToresetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }


}