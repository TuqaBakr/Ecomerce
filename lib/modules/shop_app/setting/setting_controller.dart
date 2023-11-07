import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/crud.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/constant.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/setting/setting_data.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';

class SettingController extends GetxController{
  MyServices myServices = Get.find();

  SettingData settingData = SettingData(Get.find());

  late StatusReqest statusReqest;
  ThemeData? themeData;

  void changeTheme(ThemeData theme){
    ThemeData themeData = theme;
    myServices.sharedPreferances.setString("theme", theme.toString());
    Get.changeTheme(themeData) ;
  }

  logout() async {
    statusReqest = StatusReqest.loading;
    var response = await settingData.logoutdata();
    statusReqest = handlingData(response);
    if (response["status"] == "success") {
      Get.offNamed(AppRoute.loginShop);
    }
    else {
      statusReqest = StatusReqest.failure;
    }
  }


  @override
  void onInit(){
    String? sharedPrefTheme = myServices.sharedPreferances.getString("theme") ;
    print(sharedPrefTheme) ;

   /* if(sharedPrefLang == ""){
      language = const Locale("ar") ;
    }
    else if(sharedPrefLang == "en"){
      language = const Locale("en") ;
    }
    else{
      language = Locale(Get.deviceLocale!.languageCode) ;
    }

    */
  }

}