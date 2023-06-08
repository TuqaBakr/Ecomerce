import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:weam/components/components.dart';
import 'package:weam/modules/shop_app/resetPassword/successReset_controller.dart';

import '../../../constant.dart';

class successReset extends StatelessWidget {
  const successReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    successResetControllerImp controller = Get.put(successResetControllerImp());
    return Scaffold(
      backgroundColor: thirdBackColor,
      body: Form(
        key: controller.fromstate,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              Text(
                'Success ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'DeliciousHandrawn',
                  color: firstBackColor,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: forthBackColor,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Register Completed Successfully',
                style: TextStyle(
                  fontSize: 18.0,
                  color: firstBackColor,
                  fontWeight: FontWeight.bold,

                ),

              ),
              Spacer(),
              defaultButtom(
                color: forthBackColor,
                text: ' Go To Login',
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
