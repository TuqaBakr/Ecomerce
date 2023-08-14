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
        totalprice = int.parse(response["totalprice"]);
        totalcount = response["counts"];
        update();
        print("gggggggggggggaaaaattttt$data[1]");
        //return countitems;
      }
      else{
        Get.rawSnackbar(
          title: " Opss",
          messageText: const Text("Don't have any data here"),

        );
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
  }

  refreshPage(){
    resetVarCart();
    view();
  }



/*



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
    view();
    super.onInit();
  }
}