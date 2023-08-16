import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/cart/cart_controller.dart';
import 'package:weam/widget/cart/buttomcart.dart';
import '../../../constant.dart';
import '../../routes.dart';


class CustomBottomNavigationBarCart extends GetView<CartController> {
  final String totalprice ;
  final String totalcount ;
  const CustomBottomNavigationBarCart({Key? key, required this.totalprice,required this.totalcount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child:Row(
                  children: [
                    const Text(
                      "Now you have " ,
                      style: TextStyle(
                        color:firstBackColor ,
                        fontSize: 12
                    ),),
                    Text(
                      totalcount ,
                      style:const TextStyle(
                          color:forthBackColor ,
                          fontSize: 20
                      ),),
                    const Text(
                      " Product in your cart" ,
                      style:TextStyle(
                          color:firstBackColor ,
                          fontSize: 12
                      ),),
                  ],
                )),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(color: fifthBackColor,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:const Text(
                  "Shipping" ,
                  style: TextStyle(
                      color:sevenBackColor ,
                      fontWeight: FontWeight.bold ,
                      fontSize: 15
                  ),)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "5\$",
                  style:TextStyle(
                      color:forthBackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(color: fifthBackColor,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:const Text(
                  "Total Price" ,
                  style: TextStyle(
                      color:sevenBackColor ,
                      fontWeight: FontWeight.bold ,
                      fontSize: 18
                  ),)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$totalprice\$",
                  style:const  TextStyle(
                      color:forthBackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),)),
          ],
        ),
        const SizedBox(height: 15,),
        ButtomCart(
          text: 'Place Order',
          color: secondBackColor,
          onPressed: (){
           controller.goToPageCheckout();
         //  controller.refreshPage();
          },

        )
      ],
    ),);
  }
}
