import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/register/register_shop_controller.dart';

import '../../../constant.dart';
import 'forgetpassword_controller.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}
class _forgetPasswordState extends State<forgetPassword> {
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: thirdBackColor,
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller)=>
        controller.statusReqest == StatusReqest.loading ?
            Center(child: Text("loading..."),) :
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: controller.fromstate,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Forget Password !! '.tr,
                    textAlign: TextAlign.center,
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
                      return validInput(val!, 5 , 100 , "email".tr);
                    },
                    labeltext: "Email",
                    iconData: Icons.email,
                    mycontroller:controller.email ,
                    hinttext: "Enter your Email".tr,
                    isNumber: false,
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  DefaultButton(
                    text: 'Check'.tr,
                    color: forthBackColor,
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      ),

    );
  }
}

