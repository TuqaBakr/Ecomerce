import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:weam/components/components.dart';
import 'package:weam/modules/shop_app/resetPassword/successReset_controller.dart';

import '../../../constant.dart';

class SuccessReset extends StatelessWidget {
  const SuccessReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    successResetControllerImp controller = Get.put(successResetControllerImp());
    return Scaffold(
      backgroundColor: thirdBackColor,
      body: Form(
        key: controller.fromstate,
        child: Container(
          padding:const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 80.0,
              ),
              Text(
                'Success '.tr,
                textAlign: TextAlign.center,
                style:const TextStyle(
                  fontFamily: 'DeliciousHandrawn',
                  color: firstBackColor,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              const Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: forthBackColor,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                'Register Completed Successfully'.tr,
                style:const TextStyle(
                  fontSize: 18.0,
                  color: firstBackColor,
                  fontWeight: FontWeight.bold,

                ),

              ),
              const Spacer(),
              DefaultButton(
                color: forthBackColor,
                text: ' Go To Login'.tr,
                onPressed: (){
                  controller.goToPageLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
