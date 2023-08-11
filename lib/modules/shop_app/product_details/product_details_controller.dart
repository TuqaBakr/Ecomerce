import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
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

 CartController cartController = Get.put(CartController());
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
    countitems   = await cartController.getCountItems(itemsModel.id!.toString());
    statusReqest = StatusReqest.success;
    //color = Color(int.parse(mycolor.substring(2), radix: 16));
     update();
  }

  add(){
    cartController.add(itemsModel.id!.toString(), countitems.toString(), "blue" );
    countitems++;
    update();
  }

  remove(){
    if(countitems > 0){
    cartController.delete(itemsModel.id!.toString());
    countitems--;
    update();
  }}

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
      }
    }
    print("${statusRequest}ffffffffffffff") ;
    update();
  }

}