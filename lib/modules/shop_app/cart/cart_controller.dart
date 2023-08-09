import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/cart/cart_data.dart';
import 'package:weam/services/services.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController{

  CartData cartData = CartData(Get.find());

  late StatusReqest statusReqest ;

  MyServices myServices =Get.find();

  add(String itemsid)async{
   statusReqest =StatusReqest.loading;
   var response = await cartData.addCart(
     myServices.sharedPreferances.getString("id")!,itemsid);
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

  delete(){

  }

  view(){

  }
}