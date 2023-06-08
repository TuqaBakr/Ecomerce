import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:weam/components/components.dart';
import 'package:weam/modules/shop_app/forgetpassword/forgetpassword_controller.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/register/register_shop_controller.dart';
import 'package:weam/modules/shop_app/verfiycode/verfiycode_controller.dart';

import '../../../constant.dart';

class verfiycode extends StatefulWidget {
  const verfiycode({Key? key}) : super(key: key);

  @override
  State<verfiycode> createState() => _verfiycodeState();
}

class _verfiycodeState extends State<verfiycode> {
  @override
  Widget build(BuildContext context) {
    verfiycodeControllerImp controller = Get.put(verfiycodeControllerImp());
    return Scaffold(
      backgroundColor: thirdBackColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Verification Code',
                  textAlign: TextAlign.center,
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
                Text(
                  'Please enter the Verification code of your email !',
                  style: TextStyle(color: secondBackColor,
                     ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                OtpTextField(
                  cursorColor: forthBackColor,
                  enabledBorderColor: forthBackColor,
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: forthBackColor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code ){

                  },
                  onSubmit: (String verificationCode){
                        controller.goToresetPassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

