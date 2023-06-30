 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/services/services.dart';

import 'home_data.dart';

abstract class HomeController extends GetxController{
initialData();
getdata();
}

class HomeControllerImp extends HomeController{
 MyServices myServices = Get.find() ;
  late TextEditingController search;

  String? username;
  String? id ;

 HomeData homeData = HomeData(Get.find()) ;

 List data = [] ;

 late StatusReqest statusReqest ;


 @override
  void onInit() {
    getdata();
    initialData();
    search = TextEditingController();
    super.onInit();
  }

  @override
  getdata() async{
    statusReqest = StatusReqest.loading;
    var response = await homeData.getData() ;
    statusReqest = handlingData(response) ;
    if(StatusReqest.successs == statusReqest){
      if(response['status'] == statusReqest){
        data.addAll(response['data']) ;
      }
      else {
        statusReqest = StatusReqest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
  username = myServices.sharedPreferances.getString("username") ;
  id = myServices.sharedPreferances.getString("id") ;
  }


}