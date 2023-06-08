import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Future<bool> alertExitApp(){
  Get.defaultDialog(
    title: "Alert",
    middleText: "Do you want to exit the application ?",
    actions:[
      ElevatedButton(
          onPressed: (){
             exit(0);
      } ,
          child: Text("Yes")),
      ElevatedButton(
          onPressed: (){
            Get.back();
          } ,
          child: Text("No")),
    ],
  );
  return Future.value(true);
}