import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/auth/register.dart';
import 'package:weam/class/crud.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';

abstract class registerController extends GetxController{
  registerShop();
  goTologinShop();
}

class registerShopControllerImp extends registerController {

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  bool isshowpassword = true;

   StatusReqest statusReqest =StatusReqest.none;

 registerData RegisterData = registerData(Get.find()) ;

  List data = [] ;

  showPassword(){
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  GlobalKey<FormState>fromstate = GlobalKey<FormState>();

  @override
  registerShop() async {
    if(fromstate.currentState!.validate()) {
      statusReqest = StatusReqest.loading;
      update();
     var response = await RegisterData.postdata(
         username.text,password.text,email.text,phone.text) ;
      statusReqest = handlingData(response) ;
      if(StatusReqest.success == statusReqest){
        if(response['status'] == 'success'){
          //data.addAll(response['data']) ;
          Get.offNamed(AppRoute.verficoderegister , arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: "warning" ,
              middleText: "phone or email already exists",
          );
          statusReqest = StatusReqest.failure;
        }
      }
     update();
     // Get.delete<registerShopControllerImp>();
    }
    else {}
  }

  @override
  goTologinShop() {
    Get.offNamed(AppRoute.loginShop);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }



}