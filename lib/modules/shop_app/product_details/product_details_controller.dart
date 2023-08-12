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
  late int countitems = 0;
  late ItemsModel itemsModel ;
  late int productId ;
  late StatusReqest statusRequest ;
  late List product  = [] ;
  late List attribute  = [] ;
  late String colorString;
  late Color color ;
  //late String color = "0xFFF1F2F6" ;

  initialData()async{
    statusReqest =StatusReqest.loading;
    productId    = Get.arguments['ProductID']  ;
    itemsModel   = Get.arguments['ProductModel'] ;
//    countitems   = await cartController.getCountItems(itemsModel.id!);
    statusReqest = StatusReqest.success;
    //color = Color(int.parse(mycolor.substring(2), radix: 16));
     update();
  }

  goToCart(){
   // cartController.view();
    Get.toNamed(AppRoute.cart);
  }

/*
 getCountItems() async {
   statusReqest = StatusReqest.loading;
   int countitems = 0;
   var response = await productData.getCountCart(itemsModel.id!);
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
*/

 Add() async {

   countitems++;
   statusReqest = StatusReqest.loading;
   var response = await productData.addCart(token, itemsModel.id!.toString(), countitems+1, colorString);
   print("========controller $response");
   statusReqest = handlingData(response);
   if (response['status'] == "success") {
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

 Delete() async {
   statusReqest = StatusReqest.loading;
   if(countitems > 0) {
     countitems--;
     update();
     var response = await productData.deleteCart(
         token, itemsModel.id!.toString(), countitems.toString(), colorString);
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
       statusReqest = StatusReqest.failure;
     }
   }
   else{
     Get.rawSnackbar(
       messageText: Text(" تم حذف المنتج من السلة"),
       title: " hbd",
     );
     print("wwwawaw23123");}
 }

 /*
  add(){
    cartController.add(itemsModel.id!.toString(), countitems.toString(), colorString );
    countitems++;
    update();
  }

  remove(){
    print( "11kjkjkjkjkjkjkjk $countitems");
    if(countitems > 0){
      print( "22kjkjkjkjkjkjkjk $countitems");
     print(countitems );
   // cartController.delete(itemsModel.id.toString());
      cartController.delete(itemsModel.id!.toString(), countitems.toString(), colorString );
      print( "33kjkjkjkjkjkjkjk $countitems");
    countitems--;
      print( "55kjkjkjkjkjkjkjk $countitems");
    update();
  }}
*/
  @override
  void onInit() {

    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    product.clear();
    attribute.clear();
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
        colorString = attribute[1]["color"];
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