import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/cartmodel.dart';
import 'package:weam/modules/shop_app/cart/cart.dart';
import 'package:weam/modules/shop_app/cart/cart_data.dart';
import 'package:weam/services/services.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../routes.dart';

class CartController extends GetxController {

  CartData cartData = CartData(Get.find());

  late StatusReqest  statusRequest; //= StatusReqest.loading;

  MyServices myServices = Get.find();

  List <CartModel>data = [];

  int totalprice = 0;

  int totalcount = 0;

  add(String itemsid, int quaintity, String color) async {
    statusRequest = StatusReqest.loading;
    update();
      var response = await cartData.addCart(
        token,
        itemsid,
        quaintity,
        color);
    print("========controller $response");
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      print("asksakkkkkkkkdssds");
      Get.rawSnackbar(
        title: " اشعار",
        messageText: Text(" تم اضافة المنتج الى السلة"),
      );
    }
    else {
      statusRequest = StatusReqest.failure;
    }
    update();
  }

  delete(String itemsid, String quaintity, String color) async {
    statusRequest = StatusReqest.loading;
    update();
    var response = await cartData.deleteCart(token, itemsid, quaintity, color);
    print("========================================================controller $response");
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      print("asksakkkkkkkkdssds");
      Get.rawSnackbar(
        messageText: Text(" تم حذف المنتج من السلة"),
        title: " اشعار",
      );
    }
    else {
      statusRequest = StatusReqest.failure;
    }
    update();
  }

  getCountItems(int itemsid) async {
    statusRequest = StatusReqest.loading;
    int countitems = 0;
    var response = await cartData.getCountCart(itemsid);
    print("======tytytytytyty==controller $response");
    statusRequest = handlingData(response);
    if (response["status"] == "success") {
      countitems = response["count"];
      print("gggggggggggggaaaaattttt$countitems");
      return countitems;
    }
    else {
      statusRequest = StatusReqest.failure;
    }
  }

  view() async {
    statusRequest = StatusReqest.loading;
       // update() ;
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
        totalprice = int.parse(response["totalprice"]);
        totalcount = response["counts"];
        update();
        print("gggggggggggggaaaaattttt$data[1]");
        //return countitems;
      }
      else{
       // data.clear();
       // totalcount = 0 ;
       // totalprice = 0 ;
        update();
        Get.snackbar( " Opss", "Don't have any data here");
      }
    }
      else {
        statusRequest = StatusReqest.failure;
      }
    }

  }

  resetVarCart(){
    totalcount = 0;
    totalprice = 0;
    data.clear();
    update();
  }

  refreshPage(){
    view();
    update();
    resetVarCart();
  }

 goToPageCheckout(){
    if(data.isEmpty) return Get.snackbar("Warning..", "Empty cart") ;
      Get.toNamed(AppRoute.checkout, arguments: {
     "price_order": totalprice,

   });
 }



  @override
  void onInit() {
    view();
    //refreshPage();
    update();
    super.onInit();
    //data.clear();
    //

  }
}