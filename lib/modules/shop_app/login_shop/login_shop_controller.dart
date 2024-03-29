import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/auth/login.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/constant.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';

abstract class LoginController extends GetxController{
  loginShop();
  goToRegisterShop();
  goToForgetPassword();
}

class LoginShopControllerImp extends LoginController {

  loginData logindata =loginData(Get.find());

  MyServices myServices =Get.find();

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  StatusReqest statusReqest = StatusReqest.none;

  showPassword(){
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  loginShop() async {
    if(fromstate.currentState!.validate()) {
      statusReqest = StatusReqest.loading;
      update();
      var response = await logindata.postdata(email.text,password.text) ;
      statusReqest = handlingData(response) ;
      if(StatusReqest.success == statusReqest){
        if(response['status'] == 'success'){
          String responseToken = response["token"] ;
          myServices.sharedPreferances.remove("tokem") ;
          myServices.sharedPreferances.setString("token",responseToken );
          print(myServices.sharedPreferances.getString("token"));
         // token = response["token"];
          Get.offNamed(AppRoute.homePage);
        } else {
          Get.defaultDialog(
            title: "warning" ,
            middleText: "email or password not correct",
          );
          statusReqest = StatusReqest.failure;
        }
      }
      update();
    }else{}
  }

  @override
  goToRegisterShop() {
    Get.offNamed(AppRoute.registerShop);
  }

  @override
  goToForgetPassword() {
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