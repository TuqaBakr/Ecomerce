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

}