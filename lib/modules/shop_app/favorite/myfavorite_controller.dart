import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/myfavorite.dart';
import 'package:weam/modules/shop_app/items/favorite_data.dart';

import 'my_favorite_data.dart';

class MyFavoriteController extends GetxController{

  late StatusReqest statusRequest ;

  TextEditingController? Search ;
  bool isSearch = false ;

  List<MyFavoriteModel> data = [];

  MyFavoriteData favoriteData = MyFavoriteData(Get.find()) ;
  Map isfavorite ={

  };

  setFavorite(id, val){
    isfavorite[id] = val ;
    update();
  }

  //addtofavorite
  /*
  addfav(String itemsid) async {
    statusRequest = StatusReqest.loading;
    update();
    var response = await favoriteData.addfavorite(itemsid);
    print("========controller $response");
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      print("asksakkkkkkkkdssds");
      Get.rawSnackbar(
        title: " اشعار",
        messageText:const Text(" تم اضافة المنتج الى السلة"),
      );
    }
    else {
      statusRequest = StatusReqest.failure;
    }
  }

  //delete favorit
  deletefav(String itemsid) async {
    statusRequest = StatusReqest.loading;
    update();
    var response = await favoriteData.deletefavorite(itemsid);
    print("========controller $response");
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      print("asksakkkkkkkkdssds");
      Get.rawSnackbar(
        title: " اشعار",
        messageText: Text(" تم حذف المنتج الى السلة"),
      );
    }
    else {
      statusRequest = StatusReqest.failure;
    }
  }
*/
  viewfavorite() async {

    statusRequest = StatusReqest.loading;
    var response = await favoriteData.viewfavorite() ;
    print("rererere========================== $response");
    statusRequest = handlingData(response) ;
    if(StatusReqest.success == statusRequest){
      data.clear();
      if(response['status'] == "success"){
        List listData = response['favorites'];
        data.addAll(listData.map((e) => MyFavoriteModel.fromJson(e))) ;
        print(response);
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {

    viewfavorite();
    super.onInit();
  }


}