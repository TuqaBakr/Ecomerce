import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class verfiycoderegisterController extends GetxController{
  checkCode();
  goTosuccessRegister();
}

class  verfiycoderegisterControllerImp extends verfiycoderegisterController {
  late String verfiycode;


  @override
  checkCode() {
  }


  @override
  goTosuccessRegister() {
    Get.offNamed(AppRoute.successRegister);
  }

  @override
  void onInit() {
    super.onInit();
  }


}