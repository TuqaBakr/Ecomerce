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
goToSubCategory(List categories, int selectedCat);
goToProductDetails(int productId);
}

class HomeControllerImp extends HomeController{
 MyServices myServices = Get.find() ;
 late TextEditingController search;
 String? username ;
 String? id ;
 String? lang;

 HomeData homeData = HomeData(Get.find()) ;

 List data = [] ;
 List categories = [] ;
 List highestProducts = [];
 List discountProducts = [] ;

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
  id       = myServices.sharedPreferances.getString("id") ;
  lang     = myServices.sharedPreferances.getString("lang") ;
  }

  @override
  getdata() async {
    statusRequest = StatusReqest.loading;
    var response = await homeData.getData() ;
   // print("rererere========================== $response");
    statusRequest = handlingData(response) ;
    if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        categories.addAll(response['catigores']) ;
        highestProducts.addAll(response['highestproducts']) ;
        discountProducts.addAll(response['discounts']) ;


        // product.addAll(response['items']) ;
        print("9999999588989898989898") ;
        print(response['highestproducts']) ;
        //print(response);
       // print(categories) ;
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }
    print("${statusRequest}ffffffffffffff") ;
    update();
  }

  @override
  goToSubCategory( categories, selectedCat  ) {
   Get.toNamed(AppRoute.items, arguments: {
     "categories"  : categories,
     "selectedCat" : selectedCat
   }) ;
  }

  @override
  goToProductDetails( productId, ) {
   Get.toNamed(AppRoute.productDetails, arguments: {
     "ProductID" : productId,
   });
  }


}