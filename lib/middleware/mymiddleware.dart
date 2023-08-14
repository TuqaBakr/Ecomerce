import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';

class MyMiddleware extends GetMiddleware{
  int? get priority =>1;

  MyServices myServices =Get.find();

  @override
  RouteSettings? redirect(String? route) {
      if(myServices.sharedPreferances.getString("onboarding") == "1"){
        return const RouteSettings(name: AppRoute.loginShop);
      }
  }

}