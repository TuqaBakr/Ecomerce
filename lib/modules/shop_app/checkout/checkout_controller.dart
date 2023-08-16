import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/constant.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/modules/shop_app/checkout/checkout_data.dart';
import 'package:weam/routes.dart';

class CheckoutController extends GetxController{


  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  StatusReqest statusReqest = StatusReqest.none;

  var paymentMethod ;
  var deliveryType;
  var typeorder = '0';
  late TextEditingController address;
  late String totalPrice ;

@override
  checkout() async {


    if(address == Null) return Get.snackbar("Error..", "Enter your address") ;
    if(deliveryType == Null) return Get.snackbar("Error..", "Enter your deliveryType") ;

    statusReqest = StatusReqest.loading;
   // update();

    Map data = {
      "type_order" : typeorder.toString(),
      "token" : token.toString(),
      "address" : address.text.toString(),
    };

    print(data);
    var response = await checkoutData.checkout(data);
    print("======tytytytytyty==controller $response");
    statusReqest = handlingData(response);
    if (response["status"] == "success") {
     Get.offNamed(AppRoute.homePage);
     Get.snackbar("Success..", " Done Successfully") ;
    }
    else {
      statusReqest = StatusReqest.none;
      Get.snackbar("Warning..", "Please Try Again") ;
      print("======tytytytytyty==controller $response");
    }
    update();
  }

  choosePaymentMethod(String val){
    paymentMethod =val;
    update();
  }

  chooseDeliveryType(String val, String oredertype){
    deliveryType = val;
    typeorder = oredertype ;

    update();
  }

  @override
  void dispose(){
    address.dispose();
    super.dispose();
  }

  @override
 void onInit(){
   totalPrice = Get.arguments["price_order"].toString() ;
   address = TextEditingController();
   super.onInit();
  }


}