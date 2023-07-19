import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/auth/verfiycodeRegister.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class verfiycoderegisterController extends GetxController{
  checkCode();
  goTosuccessRegister(String VerfiycodeRegister);
}

class  verfiycoderegisterControllerImp extends verfiycoderegisterController {
  verfiycoderegisterData Verfiycoderegisterdata= verfiycoderegisterData(Get.find());


  StatusReqest? statusReqest;

  String ? email;

  @override
  checkCode() {
  }


  @override
  goTosuccessRegister(VerfiycodeRegister) async {
    statusReqest = StatusReqest.loading;
    update();
    var response = await Verfiycoderegisterdata.postdata(email! ,VerfiycodeRegister) ;
    statusReqest = handlingData(response) ;
    if(StatusReqest.success == statusReqest){
      if(response['status'] == 'success'){
        Get.offNamed(AppRoute.successRegister);
      } else {
        Get.defaultDialog(
          title: "warning" ,
          middleText: "verify code not correct",
        );
        statusReqest = StatusReqest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email =Get.arguments['email'];
    super.onInit();
  }


}