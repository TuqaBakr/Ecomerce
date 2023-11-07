import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/cartmodel.dart';
import 'package:weam/modules/shop_app/cart/cart_data.dart';
import 'package:weam/modules/shop_app/favorite/favorite.dart';
import 'package:weam/modules/shop_app/home_page/home_page.dart';
import 'package:weam/modules/shop_app/orders/Oreder.dart';
import 'package:weam/modules/shop_app/setting/setting.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentpage) ;

}

class HomeScreenControllerImp extends HomeScreenController{

  int currentPage = 0;
  CartData cartData = CartData(Get.find());

  late StatusReqest  statusRequest;
  List <CartModel>data = [];


  List<Widget> listPage =[
    const HomePage(),
    const Orders(),
    const Favorite(),
    Setting()

  ];

  List bottomappbar = [
    {"title" : "Home".tr , "icon":Icons.home},
    {"title" : "Order".tr , "icon":Icons.point_of_sale_sharp},
    {"title" : "Favorite".tr , "icon":Icons.favorite},
    {"title" : "Setting".tr , "icon":Icons.settings},
  ];



  @override
  changePage(int i) {
    currentPage = i ;
    update() ;
  }

  view() async {
    statusRequest = StatusReqest.loading;
    update() ;
    var response = await cartData.viewCart();
    print("======tytytytytyty== $response");
    statusRequest = handlingData(response);
    if(StatusReqest.success == statusRequest ){
      if (response["status"] == "success") {
        List responsedata = response['Cart'] ;
        if(responsedata.isNotEmpty){
          responsedata = response['Cart'] ;
          data.clear();
          data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
         // totalprice = int.parse(response["totalprice"]);
         // totalcount = response["counts"];
          update();
          print("gggggggggggggaaaaattttt$data[1]");
          //return countitems;
        }
        else{
         // Get.snackbar( " Opss", "Don't have any data here");
        }
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }

  }



  refreshPage(){
    data.clear();
    view();
  }


}