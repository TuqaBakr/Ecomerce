import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/auth/forgetpassword/Forgetpassword.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();
}

class  ForgetPasswordControllerImp extends ForgetPasswordController {

  forgetpasswordData ForgetpasswordData= forgetpasswordData(Get.find());

  late TextEditingController email;

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  StatusReqest? statusReqest;
  @override
  checkemail() async {
    if (fromstate.currentState!.validate()){
      statusReqest = StatusReqest.loading;
      update();
      var response = await ForgetpasswordData.postdata(email.text) ;
      statusReqest = handlingData(response) ;
      if(StatusReqest.success == statusReqest){
        if(response['status'] == 'success'){
          Get.offNamed(AppRoute.verfiycode , arguments: {
            "email":email.text
          });
        } else {
          Get.defaultDialog(
            title: "warning" ,
            middleText: "email not found",
          );
          statusReqest = StatusReqest.failure;
        }
      }
      update();
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