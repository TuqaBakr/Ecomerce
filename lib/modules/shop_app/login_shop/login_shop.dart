import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/alertexit.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/logo/logo.dart';
import 'package:weam/modules/shop_app/register/register_shop.dart';
import '../../../constant.dart';
import 'login_shop_controller.dart';


class LoginShop extends StatefulWidget {
  const LoginShop({Key? key}) : super(key: key);
  @override
  _loginShopState createState() => _loginShopState();
}

class _loginShopState extends State<LoginShop> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginShopControllerImp());
    return Scaffold(
      backgroundColor: thirdBackColor,
      body:GetBuilder<LoginShopControllerImp>(
          builder: (controller) =>
              HandlingDataRequest( statusRequest:controller.statusReqest,
                widget: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: WillPopScope(
                    onWillPop: alertExitApp,
                    child: Center(
                      child: Form(
                        key: controller.fromstate,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height/30,// 40.0,
                              ),
                              const Logo(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height/30,// 40.0,
                              ),
                              Text(
                                'Login'.tr,
                                style:TextStyle(
                                  fontFamily: 'DeliciousHandrawn',
                                  color: firstBackColor,
                                  fontSize: MediaQuery.of(context).size.width/6, //60.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height/15,
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
                               SizedBox(
                                height: MediaQuery.of(context).size.height/30,
                              ),
                              GetBuilder<LoginShopControllerImp>(
                                builder:(controller) => FormFeild(
                                  obscureText: controller.isshowpassword,
                                  onTapIcon: (){
                                    controller.showPassword();
                                               },
                                  valid: (val){
                                    return validInput(val!, 5 , 30 , "password");
                                              },
                                  labeltext: "password".tr,
                                  iconData: Icons.remove_red_eye_outlined,
                                  mycontroller:controller.password,
                                  hinttext: "Enter your password".tr,
                                  isNumber: false,
                                ),
                              ),
                              SizedBox(
                                height:MediaQuery.of(context).size.height/15,
                              ),
                              InkWell(
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                  Text(
                                      'Forget Password ?'.tr,
                                      textAlign: TextAlign.end,
                                  style:TextStyle(
                                    fontSize: MediaQuery.of(context).size.width/30,
                                  )

                                    ),
                                  ],
                                ),
                                onTap: ()
                                {
                                  controller.goToForgetPassword();
                                },

                              ),
                               SizedBox(
                                height:MediaQuery.of(context).size.height/80,
                              ),
                              DefaultButton(
                                text: 'Login'.tr,
                                color: secondBackColor,
                                onPressed: () {
                                  controller.loginShop();
                                },
                              ),
                              SizedBox(
                                height:MediaQuery.of(context).size.height/50,
                              ),
                              DefaultButton(
                                text: 'ReGister'.tr,
                                color: forthBackColor,
                                onPressed: () {
                                  controller.goToRegisterShop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),))

    );
  }
}

