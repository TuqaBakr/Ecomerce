import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/resetPassword/resetPassword.dart';
import 'package:weam/routes.dart';

abstract class resetPasswordController extends GetxController{
  resetPassword();
  goTosuccessReset();
}

class  resetPasswordControllerImp extends resetPasswordController {

  late TextEditingController password;
  late TextEditingController repassword;

  bool isshowpassword = true;

  showPassword(){
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  @override
  resetPassword() {
  }

  @override
  goTosuccessReset() {
    var formdata = fromstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.successReset);
      Get.delete<resetPasswordControllerImp>();
    }
    else{
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

}