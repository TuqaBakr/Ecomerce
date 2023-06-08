
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/alertexit.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/logo/logo.dart';
import 'package:weam/modules/shop_app/register/register_shop.dart';
import '../../../constant.dart';
import 'login_shop_controller.dart';


class loginShop extends StatefulWidget {
  const loginShop({Key? key}) : super(key: key);
  @override
  _loginShopState createState() => _loginShopState();
}

class _loginShopState extends State<loginShop> {
  @override
  Widget build(BuildContext context) {
    loginShopControllerImp controller = Get.put(loginShopControllerImp());
    return Scaffold(
      backgroundColor: thirdBackColor,
      body: Padding(
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
                      logo(),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Login',
                           style: TextStyle(
                          fontFamily: 'DeliciousHandrawn',
                          color: firstBackColor,
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
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
                      GetBuilder<loginShopControllerImp>(
                          builder:(controller) => FormFeild(
                            obscureText: controller.isshowpassword,
                            onTapIcon: (){
                              controller.showPassword();
                            },
                            valid: (val){
                              return validInput(val!, 5 , 30 , "password");
                            },
                            labeltext: "password",
                            iconData: Icons.remove_red_eye_outlined,
                            mycontroller:controller.password,
                            hinttext: "Enter your password",
                            isNumber: false,
                          ),),
                      SizedBox(
                        height: 100.0,
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password ?',
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        onTap: ()
                        {
                          controller.goToforgetPassword();
                        },

                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultButtom(
                        text: 'Login',
                        color: secondBackColor,
                        onPressed: () {
                          controller.loginShop();
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultButtom(
                        text: 'ReGister',
                        color: forthBackColor,
                        onPressed: () {
                          controller.goToregisterShop();
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

