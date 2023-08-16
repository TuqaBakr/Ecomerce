
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/ordermoder.dart';
import 'package:weam/modules/shop_app/orders/order_data.dart';

class OrderController extends GetxController{

  OrderData orderData = OrderData(Get.find()) ;

  late StatusReqest statusRequest ;
  List<OrderModel> data = [];


 String typeOrder(String val){
   if(val == "0") {
     return "Delivery" ;
   }else {
     return "Shipping & Delivery";
   }
  }
  PayMethod(String val){
    if(val == "0") {
      return "Cash" ;
    }else {
      return "Cart";
    }
  }


  getOrder() async {
    statusRequest = StatusReqest.loading;
    var response = await orderData.getData() ;
    print("rererere========================== $response");
    statusRequest = handlingData(response) ;
    if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        List listdata = response['orders'];
        data.addAll(listdata.map((e) => OrderModel.fromJson(e))) ;
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
    getOrder();
    super.onInit();
  }

}