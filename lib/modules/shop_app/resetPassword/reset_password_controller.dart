import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/auth/forgetpassword/resetpassowrd.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/resetPassword/reset_password.dart';
import 'package:weam/routes.dart';

abstract class resetPasswordController extends GetxController{
  resetPassword();
  goTosuccessReset();
}

class  resetPasswordControllerImp extends resetPasswordController {
  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  resetpasswordData ResetpasswordData = resetpasswordData(Get.find());

  late TextEditingController password;
  late TextEditingController repassword;

  bool isshowpassword = true;

  StatusReqest? statusReqest;

  String? email;

  showPassword(){
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }


  @override
  resetPassword() {}

  @override
  goTosuccessReset() async{
    if(password.text != repassword) {
      return Get.defaultDialog
        (title: "warning", middleText: "password not match ");
    }
    if(fromstate.currentState!.validate()){
      statusReqest = StatusReqest.loading;
      update();
      var response = await ResetpasswordData.postdata(email! , password.text) ;
      statusReqest = handlingData(response) ;
      if(StatusReqest.success == statusReqest){
        if(response['status'] == 'success'){
          Get.offNamed(AppRoute.successReset);
        } else {
          Get.defaultDialog(
            title: "warning" ,
            middleText: "try again",
          );
          statusReqest = StatusReqest.failure;
        }
      }
      update();
      Get.delete<resetPasswordControllerImp>();
    }
    else{
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email =Get.arguments['email'];
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