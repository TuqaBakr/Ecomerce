import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/modules/shop_app/checkout/checkout_controller.dart';
import '../../../constant.dart';
import '../../../routes.dart';


class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      bottomNavigationBar: Container(
        margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 50,
        child: MaterialButton(
          onPressed: (){
          },
          child:Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Row(children: const[
              Text('Checkout', style: TextStyle(
                  fontWeight: FontWeight.bold, color: whiteBackColor),),
              SizedBox(width: 5,),
              Icon(Icons.check_circle_outline_outlined, color: whiteBackColor),
            ],),
          ),

          color: secondBackColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      body:GetBuilder<CheckoutController>(builder:(controller)=>
          HandlingDataView(
              statusRequest: controller.statusReqest,
              widget: Container (
        padding: const EdgeInsets.all(20),
        color: whiteBackColor,
        child: ListView(
          children: [
            const SizedBox(
              height: 12,),
            const Center(
              child:  Text(
                'Checkout',
                style: TextStyle(
                  fontFamily: 'DeliciousHandrawn',
                  color: firstBackColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,),
            const Text(
              "Choose Payment Method :",
              style: TextStyle(
                color: firstBackColor,
                //fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,),
            InkWell(
              onTap: (){
                controller.choosePaymentMethod("cash");
              },
              child: CardPaymentMethod(
                title: 'Cash ',
                isActive: controller.paymentMethod == "cash"? true : false,

              ),
            ),
            const SizedBox(
              height: 10,),
            InkWell(
              onTap: (){
                controller.choosePaymentMethod("card");
              },
              child:  CardPaymentMethod(
                title: 'Payment Card',
                isActive: controller.paymentMethod == "card"? true : false,

              ),
            ),
            const SizedBox(
              height: 40,),
            const Text(
              "Choose Delivery Type :",
              style: TextStyle(
                color: firstBackColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    controller.chosseDeliveryType("delivery");
                  },
                    child:  CardDeliveryType(
                      imagename: AppImageAsset.delivery,
                      title: 'Delivery',
                      active: controller.deliveryType == "delivery"?true : false,

                    ),
                  ),
                const SizedBox(
                  width: 40,),
                InkWell(
                  onTap: (){
                    controller.chosseDeliveryType("shipping");
                  },
                  child:  CardDeliveryType(
                    imagename: AppImageAsset.shipping,
                    title: 'Shipping',
                    active: controller.deliveryType == "shipping"?true : false,

                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,),
            const Text(
              "Choose Address :",
              style: TextStyle(
                color: firstBackColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,),
          ],
        ),
      ),
    ),),);
  }
}
