import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/components/components.dart';
import 'package:weam/modules/shop_app/cart/cart_controller.dart';
import 'package:weam/widget/cart/custombottomnavigationbarcart.dart';
import 'package:weam/widget/cart/customitemscartlist.dart';
import '../../../constant.dart';


class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar:GetBuilder<CartController>(
        builder: (controller) =>CustomBottomNavigationBarCart(
          totalprice: "${cartController.totalprice}",
          totalcount: "${cartController.totalcount}",
        ),),
      body:GetBuilder<CartController>(builder:((controller)=>ListView(
        children: [
          const SizedBox(height: 15,),
          //topAppBar
          Container(
            alignment: Alignment.center,
            child:Row(
              children: [
                Expanded(child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                )),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "My Cart".tr,
                    style:const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold, color: sevenBackColor, fontFamily: 'DeliciousHandrawn',
                    ),),
                )),
                Spacer(),
              ],),),
          const SizedBox(height: 10,),
          Container(
            color: whiteBackColor,
            padding:const EdgeInsets.all(8),
            child: Column(
              children: [
                ...List.generate(
                    controller.data.length,
                        (index) => CustomCartList(
                  name:"${cartController.data[index].name}",
                  price:"${cartController.data[index].price}",
                  image:"${cartController.data[index].image}",
                  count: "${cartController.data[index].quaintity}",)
                )

                /*
                      ...List.generate(
                          cartController.data.length,
                               (index) => CustomCartList(
                                   onAdd:(){
                                     cartController.add(cartController.data[index].id.toString(),
                                         cartController.data[index].quaintity!,
                                         "blue",);
                                     //
                                     // cartController.refreshPage();
                                   } ,
                                   onRemove: (){
                                     cartController.delete(cartController.data[index].id.toString(),
                                       cartController.data[index].quaintity.toString(),
                                       "blue",);
                                    // cartController.refreshPage();
                                   },
                                   name:"${cartController.data[index].name}",
                                   price:"${cartController.data[index].price}",
                                   image:"${cartController.data[index].image}",
                                   count: "${cartController.data[index].quaintity}",))
                        */

              ],),
          ),

        ],
      )
      ),)

    );
  }
}
