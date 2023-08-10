import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/cart/cart.dart';
import 'package:weam/modules/shop_app/cart/cart_data.dart';
import 'package:weam/services/services.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController{

  CartData cartData = CartData(Get.find());

  late StatusReqest statusReqest ;

  MyServices myServices =Get.find();

 // List<Ca> data =[];

  add(String itemsid, String quaintity, String color)async{
   statusReqest =StatusReqest.loading;
   var response = await cartData.addCart(
     myServices.sharedPreferances.getString("token")!, itemsid, quaintity, color );
   print("========controller $response");
   statusReqest = handlingData(response);
   if(StatusReqest.success == "success"){
     Get.rawSnackbar(
       title: " اشعار",
       messageText: Text(" تم اضافة المنتج الى السلة"),
     );
   }
   else {
     statusReqest =StatusReqest.failure;
   }
  }

  delete(String itemsid)async{
    statusReqest =StatusReqest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferances.getString("token")!,itemsid);
    print("========controller $response");
    statusReqest = handlingData(response);
    if(StatusReqest.success == "success"){
      Get.rawSnackbar(
        title: " اشعار",
        messageText: Text(" تم ازالة المنتج من السلة"),
      );
    }
    else {
      statusReqest =StatusReqest.failure;
    }
  }

  getCountItems(String itemsid)async{
    statusReqest =StatusReqest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferances.getString("token")!,itemsid);
    print("======tytytytytyty==controller $response");
    statusReqest = handlingData(response);
    if(response["status"] == "success"){
      int countitems = 0;
      countitems =response["count"];
      print("gggggggggggggaaaaattttt$countitems");
      return countitems;
    }
    else {
      statusReqest =StatusReqest.failure;
    }
  }


  view()async{
    statusReqest =StatusReqest.loading;
    var response = await cartData.viewCart(
        myServices.sharedPreferances.getString("token")!,);
    print("========controller $response");
    statusReqest = handlingData(response);
    if(StatusReqest.success == "success"){
      var countitems =0;
      countitems =int.parse(response['data']);
      print("$countitems");
      return countitems;
    }
    else {
      statusReqest =StatusReqest.failure;
    }
  }


  @override
  void onInit() {

    super.onInit();
  }
}