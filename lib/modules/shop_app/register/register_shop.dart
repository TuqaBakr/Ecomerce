import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/alertexit.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/register/register_shop_controller.dart';

import '../../../constant.dart';

class registerShop extends StatefulWidget {
  const registerShop({Key? key}) : super(key: key);

  @override
  State<registerShop> createState() => _registerShopState();
}
class _registerShopState extends State<registerShop> {
  @override
  registerShopControllerImp controller = Get.put(registerShopControllerImp());
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdBackColor,
      body:  WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<registerShopControllerImp>(
          builder: (controller) =>
          HandlingDataRequest( statusRequest:controller.statusReqest,
            widget: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: controller.fromstate,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Text(
                      'Register'.tr,
                      style:const TextStyle(
                        fontFamily: 'DeliciousHandrawn',
                        color: firstBackColor,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    FormFeild(
                      valid: (val){
                        return validInput(val!, 5 , 100 , "username");
                      },
                      labeltext: "Username",
                      iconData: Icons.person_outline,
                      mycontroller:controller.username ,
                      hinttext: "Enter your Username".tr,
                      isNumber: false,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    FormFeild(
                      valid: (val){
                        return validInput(val!, 5 , 100 , "email");
                      },
                      labeltext: "Email".tr,
                      iconData: Icons.email,
                      mycontroller:controller.email ,
                      hinttext: "Enter your Email".tr,
                      isNumber: false,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    FormFeild(
                      valid: (val){
                        return validInput(val!, 8 , 20 , "phone");
                      },
                      labeltext: "Phone".tr,
                      iconData: Icons.phone,
                      mycontroller:controller.phone ,
                      hinttext: "Enter your Phone".tr,
                      isNumber: true,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GetBuilder<registerShopControllerImp>(
                      builder: (controller) => FormFeild(
                        obscureText: controller.isshowpassword,
                        onTapIcon: (){
                          controller.showPassword();
                        },
                        valid: (val){
                          return validInput(val!, 6 , 30 , "password");
                        },
                        labeltext: "password".tr,
                        iconData: Icons.remove_red_eye_outlined,
                        mycontroller:controller.password ,
                        hinttext: "Enter your password".tr,
                        isNumber: false,
                      ),
                    ),
                    const  SizedBox(
                      height: 60.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultButton(
                      text: 'ReGister'.tr,
                      color: secondBackColor,
                      onPressed: () {
                        controller.registerShop();
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" have an account ? ".tr) ,
                        InkWell(
                          onTap: (){
                            controller.goTologinShop();
                          },
                          child: Text ('Login'.tr,
                            style:const TextStyle(
                              color: forthBackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),)
        ),
      ),
     );

  }
}

