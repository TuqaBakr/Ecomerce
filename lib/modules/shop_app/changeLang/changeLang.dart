// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show BuildContext, Column, Container, EdgeInsets, FontWeight, Key, MainAxisAlignment, Scaffold, SizedBox, StatelessWidget, Text, TextStyle, Widget;
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:weam/components/components.dart';
import 'package:weam/lucatization/changelocal.dart';
import '../../../constant.dart';
import '../../../routes.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.find() ;
    var boardController = PageController();
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr , style: const TextStyle(
                fontFamily: 'DeliciousHandrawn',
                color: firstBackColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 25,),
              DefaultButton(
                text: '2'.tr,
                color: secondBackColor,
                onPressed: () {
                  controller.changeLang("en") ;
                  Get.offNamed(AppRoute.onBoardingScreen);
                },
              ),
              const SizedBox(height: 10,),
              DefaultButton(
                text: '3'.tr,
                color: secondBackColor,
                onPressed: () {
                  controller.changeLang("ar") ;
                  Get.offNamed(AppRoute.onBoardingScreen) ;
                },
              ),
            ],
          ),
        )
    );

  }
}
