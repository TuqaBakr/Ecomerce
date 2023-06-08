import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();
  goToVerfiyCode();
}

class  ForgetPasswordControllerImp extends ForgetPasswordController {

  late TextEditingController email;

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  @override
  checkemail() {
  }

  @override
  goToVerfiyCode() {
    var formdata = fromstate.currentState;
    if(formdata!.validate())
    {
      Get.offNamed(AppRoute.verfiycode);
      Get.delete<ForgetPasswordControllerImp>();
    }
    else{
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }





}