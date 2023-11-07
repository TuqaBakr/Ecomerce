import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

Future<bool> alertExitApp(){
  Get.defaultDialog(
    title: "Alert".tr,
    middleText: "Do you want to exit the application ?".tr,
    actions:[
      ElevatedButton(
          onPressed: (){
             exit(0);
                       } ,
          child: Text("Yes".tr)),
      ElevatedButton(
          onPressed: (){
            Get.back();
                       } ,
          child: Text("No".tr)),
    ],
  );
  return Future.value(true);
}