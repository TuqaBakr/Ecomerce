import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: controller.fromstate,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'DeliciousHandrawn',
                        color: firstBackColor,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    FormFeild(
                      valid: (val){
                        return validInput(val!, 5 , 100 , "username");
                      },
                      labeltext: "Username",
                      iconData: Icons.person_outline,
                      mycontroller:controller.username ,
                      hinttext: "Enter your Username",
                      isNumber: false,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    FormFeild(
                      valid: (val){
                        return validInput(val!, 5 , 100 , "email");
                      },
                      labeltext: "Email",
                      iconData: Icons.email,
                      mycontroller:controller.email ,
                      hinttext: "Enter your Email",
                      isNumber: false,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    FormFeild(
                      valid: (val){
                        return validInput(val!, 8 , 20 , "phone");
                      },
                      labeltext: "Phone",
                      iconData: Icons.phone,
                      mycontroller:controller.phone ,
                      hinttext: "Enter your Phone",
                      isNumber: true,
                    ),
                    SizedBox(
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
                        labeltext: "password",
                        iconData: Icons.remove_red_eye_outlined,
                        mycontroller:controller.password ,
                        hinttext: "Enter your password",
                        isNumber: false,
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButtom(
                      text: 'ReGister',
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
                        Text(" have an account ? ") ,
                        InkWell(
                          onTap: (){
                            controller.goTologinShop();
                          },
                          child: Text (" Login ",
                            style: TextStyle(
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
        ),
      ),
     );

  }
}

