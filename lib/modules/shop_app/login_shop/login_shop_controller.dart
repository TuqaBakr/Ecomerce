import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class loginController extends GetxController{
  loginShop();
  goToregisterShop();
  goToforgetPassword();
}

class loginShopControllerImp extends loginController {

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  showPassword(){
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  loginShop() {
    var formdata = fromstate.currentState;
    if(formdata!.validate()){
      print("Valid");
    }
    else{
      print("Not Valid");
    }
  }

  @override
  goToregisterShop() {
    Get.offNamed(AppRoute.registerShop);
  }

  @override
  goToforgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }


}