import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/cartmodel.dart';
import 'package:weam/modules/shop_app/cart/cart.dart';
import 'package:weam/modules/shop_app/cart/cart_data.dart';
import 'package:weam/services/services.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class CartController extends GetxController {

  CartData cartData = CartData(Get.find());

  late StatusReqest statusReqest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  int totalprice = 0;

  int totalcount = 0;

   add(String itemsid, String quaintity, String color) async {
    statusReqest = StatusReqest.loading;
      var response = await cartData.addCart(
        token,
        itemsid,
        quaintity,
        color);
    print("========controller $response");
    statusReqest = handlingData(response);
    if (response['status'] == "success") {
      print("asksakkkkkkkkdssds");
      Get.rawSnackbar(
        title: " اشعار",
        messageText: Text(" تم اضافة المنتج الى السلة"),
      );
    }
    else {
      statusReqest = StatusReqest.failure;
    }
  }

  delete(String itemsid, String quaintity, String color) async {
    statusReqest = StatusReqest.loading;
    var response = await cartData.deleteCart(token, itemsid, quaintity, color);
    print("========================================================controller $response");
    statusReqest = handlingData(response);
    if (response['status'] == "success") {
      print("asksakkkkkkkkdssds");
      Get.rawSnackbar(
        messageText: Text(" تم حذف المنتج من السلة"),
        title: " اشعار",
      );
    }
    else {
      statusReqest = StatusReqest.failure;
    }
  }




   getCountItems(int itemsid) async {
    statusReqest = StatusReqest.loading;
    int countitems = 0;
    var response = await cartData.getCountCart(itemsid);
    print("======tytytytytyty==controller $response");
    statusReqest = handlingData(response);
    if (response["status"] == "success") {
      countitems = response["count"];
      print("gggggggggggggaaaaattttt$countitems");
      return countitems;
    }
    else {
      statusReqest = StatusReqest.failure;
    }
  }
/*
  resetVarCart(){
    totalcount=0;
    totalprice=0;
    data.clear();
  }

  refreshPage(){
    resetVarCart();
    //view();
  }
*/
/*
  view() async {
    update();
    print("ouououououououo");
    statusReqest = StatusReqest.loading;
    var response = await cartData.viewCart(token);
    print("========controller $response");
    statusReqest = handlingData(response);
    if (response["status"] == "success") {
      List dataresponse = response["Cart"];
      data.clear();
      data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
      totalcount = response["counts"];
      totalprice = int.parse(response["totalprice"]);
    }
    else {
      statusReqest = StatusReqest.failure;
    }
    update();
  }

*/
  @override
  void onInit() {
    //view();
    super.onInit();
  }
}