import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/auth/forgetpassword/verfiycode.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class verfiycodeController extends GetxController{
  checkCode();
  goToresetPassword(String Verfiycode);
}

class  verfiycodeControllerImp extends verfiycodeController {

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

   String ?email ;
  StatusReqest? statusReqest;
  verfiycodeData VerfiycodeData = verfiycodeData(Get.find());

  @override
  checkCode() {}

  @override
  goToresetPassword(Verfiycode)async {
    statusReqest = StatusReqest.loading;
    update();
    var response = await VerfiycodeData.postdata(email! ,Verfiycode) ;
    statusReqest = handlingData(response) ;
    if(StatusReqest.success == statusReqest){
      if(response['status'] == 'success'){
        Get.offNamed(AppRoute.resetPassword , arguments: {
          "email":email
        });
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