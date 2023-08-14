import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';

class CheckoutController extends GetxController{

  StatusReqest statusReqest = StatusReqest.none;

  String? paymentMethod ;
  String? deliveryType;

  choosePaymentMethod(String val){
    paymentMethod =val;
    update();
  }

  chosseDeliveryType(String val){
    deliveryType = val;
    update();
  }
}