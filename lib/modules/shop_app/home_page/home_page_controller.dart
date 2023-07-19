 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/services/services.dart';

import '../../../routes.dart';
import 'home_data.dart';

abstract class HomeController extends GetxController{
initialData();
getdata();
goToItems(List categories, int selectedCat);
}

class HomeControllerImp extends HomeController{
 MyServices myServices = Get.find() ;

 late TextEditingController search;
 String? username ;
 String? id ;

 HomeData homeData = HomeData(Get.find()) ;

 List data = [] ;
 List categories = [] ;

 late StatusReqest statusRequest ;


 @override
  void onInit() {
    getdata();
    initialData();
    search = TextEditingController();
    super.onInit();
  }

  @override
  initialData() {
  username = myServices.sharedPreferances.getString("username") ;
  id = myServices.sharedPreferances.getString("id") ;
  }

  @override
  getdata() async {
    statusRequest = StatusReqest.loading;
    var response = await homeData.getData() ;
    print("rererere========================== $response");
    statusRequest = handlingData(response) ;
    if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        categories.addAll(response['data']) ;
        print(response);
        print(categories) ;
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }
    print("${statusRequest}ffffffffffffff") ;
    update();
  }

  @override
  goToItems( categories, selectedCat) {
   Get.toNamed(AppRoute.items, arguments: {
     "categories"  : categories,
     "selectedcat" : selectedCat
   }) ;
  }


}