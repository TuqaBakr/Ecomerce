import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/cartmodel.dart';
import 'package:weam/modules/shop_app/cart/cart.dart';
import 'package:weam/modules/shop_app/cart/cart_data.dart';
import 'package:weam/services/services.dart';
import 'package:flutter/material.dart';

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
        myServices.sharedPreferances.getString("token")!,
        itemsid,
        quaintity,
        "black");
    print("========controller $response");
    statusReqest = handlingData(response);
    if (StatusReqest.success == "success") {
      Get.rawSnackbar(
        title: " اشعار",
        messageText: Text(" تم اضافة المنتج الى السلة"),
      );
    }
    else {
      statusReqest = StatusReqest.failure;
    }
  }

  delete(String itemsid) async {
    statusReqest = StatusReqest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferances.getString("token")!, itemsid);
    print("========controller $response");
    statusReqest = handlingData(response);
    if (StatusReqest.success == "success") {
      Get.rawSnackbar(
        title: " اشعار",
        messageText: Text(" تم ازالة المنتج من السلة"),
      );
    }
    else {
      statusReqest = StatusReqest.failure;
    }
  }

  getCountItems(String itemsid) async {
    statusReqest = StatusReqest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferances.getString("token")!, itemsid);
    print("======tytytytytyty==controller $response");
    statusReqest = handlingData(response);
    if (response["status"] == "success") {
      int countitems = 0;
      countitems = response["count"];
      print("gggggggggggggaaaaattttt$countitems");
      return countitems;
    }
    else {
      statusReqest = StatusReqest.failure;
    }
  }

  resetVarCart(){
    totalcount=0;
    totalprice=0;
    data.clear();
  }

  refreshPage(){
    resetVarCart();
    view();
  }


  view() async {
    statusReqest = StatusReqest.loading;
    update();
    var response = await cartData.viewCart(
      myServices.sharedPreferances.getString("token")!,);
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


  @override
  void onInit() {
    view();
    super.onInit();
  }
}