import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/constant.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/models/productmodel.dart';
import 'package:weam/modules/shop_app/cart/cart_controller.dart';
import 'package:weam/modules/shop_app/product_details/product_details_data.dart';
import 'package:weam/routes.dart';

abstract class ProductDetailsController extends GetxController{
getData();

}
class ProductDetailsControllerImp extends ProductDetailsController{

 //CartController cartController = Get.put(CartController());
  ProductData productData = ProductData(Get.find()) ;

  late StatusReqest statusReqest ;
  int countitems = 0;
  late ItemsModel itemsModel ;
  late int productId ;
  late StatusReqest statusRequest ;
  late List product  = [] ;
  late List attribute  = [] ;
  late String colorString;
  late Color color ;
  int changeamont = 1;
  List<ItemsModel> data = [];

  initialData() async {
    //statusReqest =StatusReqest.loading;
    productId    = Get.arguments['ProductID']  ;
    itemsModel   = Get.arguments['ProductModel'] ;
    countitems   = await getCountItems(itemsModel.id!);
    //statusReqest = StatusReqest.success;
    //color = Color(int.parse(mycolor.substring(2), radix: 16));
     update();
  }

  goToCart(){
    Get.toNamed(AppRoute.cart);
  }


 Add() async {
   statusReqest = StatusReqest.loading;
   var response = await productData.addCart(token, itemsModel.id!.toString(), changeamont, colorString);
   print("========controller $response");
   statusReqest = handlingData(response);
   if (response["status"] == "success") {
     //countitems = 0   ;
     print("asksakkkkkkkkdssds");
     Get.rawSnackbar(
       title: " اشعار",
       messageText: Text(" تم اضافة المنتج الى السلة"),

     );
     update();
   }
   else {
     statusReqest = StatusReqest.failure;
   }
 }
 addcount(){
   countitems++;
   Add();
   update;
 }

 Delete() async {
   statusReqest = StatusReqest.loading;
     var response = await productData.deleteCart(
         token, itemsModel.id!.toString(), changeamont.toString(), colorString);
     print(
         "========================================================controller $response");
     statusReqest = handlingData(response);
     if (response["status"] == "success") {
       print("asksakkkkkkkkdssds");
      // countitems--;
       update();
       Get.rawSnackbar(
         messageText: Text(" تم حذف المنتج من السلة"),
         title: " اشعار",
       );
     }
     else {
       Get.rawSnackbar(
         messageText: Text(" لا يمكت حذف المنتج من السلة"),
         title: " اشعار",
       );
       statusReqest = StatusReqest.failure;
     }
 }
 removecount(){
   if(countitems > 0)
    {
      Delete();
      countitems--;
      update;
    }
   else{

     Get.rawSnackbar(
       messageText: Text("OUT OF"),
       title: " اشعار",
     );
   }
  }

 getCountItems(int productid) async {
    statusReqest = StatusReqest.loading;
    //countitems = 0;
    var response = await productData.getCountCart(productid.toString());
    print("======tytytytytyty==controller $response");
    statusReqest = handlingData(response);
   // if(response.Sta)
    int countitems = 0;
    if (response["status"] == "success") {
      countitems = response["count"];
      print("gggggggggggggaaaaattttt $countitems");
      return countitems;
    }
    else {
      statusReqest = StatusReqest.failure;
      print(response + "yyyyybbb");
    }
  }


  //rating
  @override
  submitRating(int product_id,double rating)async{
    data.clear();
    statusReqest = StatusReqest.loading;
    update();
    var response = await productData.rating(product_id.toString(),rating.toString());
    print("======tytytytytyty==controller $response");
    statusReqest = handlingData(response);
    if(StatusReqest.success == statusReqest){
      if (response["status"] == "success") {
        print("666665556565 ");
        getData();
        update() ;
      }
    }
    else {
      statusReqest = StatusReqest.failure;
      print("faluieerlwjlsjdflsjf");
    }
  }

  /*
//addtofavorite
  addfav(String itemsid) async {
    statusRequest = StatusReqest.loading;
    update();
    var response = await productData.favorite(itemsid, AppLink.addfav);
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

 //delete favorit
  deletefav(String itemsid) async {
    statusRequest = StatusReqest.loading;
    update();
    var response = await productData.favorite(itemsid, AppLink.deletefav);
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
    update();
  }
*/

  @override
  void onInit() {
    //countitems = 0;
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
     statusRequest = StatusReqest.loading;
    //var response = await itemData.getData(selectedCat) ;
    var response = await productData.getData("${AppLink.productsDetails}""${productId}") ;
    print("rererere========================== $response");
    statusRequest = handlingData(response) ;
    print("$statusRequest" + "1414141414141414");
    if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        product.addAll(response['product']) ;
        attribute.addAll(response['attribute']);
        colorString = attribute[0]["color"];
        color = Color(int.parse(colorString));
        print(response);
        print("22222222222222222222$product") ;
      }
      else {
        statusRequest = StatusReqest.failure;
        print(statusRequest);
      }
    }
    print("${statusRequest}ffffffffffffff") ;
    update();
  }

}