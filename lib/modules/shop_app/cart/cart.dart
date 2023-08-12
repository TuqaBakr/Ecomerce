import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/components/components.dart';
import 'package:weam/modules/shop_app/cart/cart_controller.dart';

import '../../../constant.dart';
import 'bouttomcart.dart';
import 'custombottomnavigationbarcart.dart';
import 'customcartlist.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar:GetBuilder<CartController>(
        builder: (controller) =>CustomBottomNavigationBarCart(
          totalprice: "${cartController.totalprice}",
        ),),

      body:GetBuilder<CartController>(builder:((controller)=>
          HandlingDataView(
              statusRequest:controller.statusReqest ,
              widget: ListView(
                children: [
                  Container(
                    color: whiteBackColor,
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
                          child:const Text(
                            "My Cart",
                            style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold
                            ),),
                        )),
                        Spacer(),
                      ],),),
                  Container(
                    color: whiteBackColor,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                      ...List.generate(
                          cartController.data.length,
                               (index) => CustomCartList(
                                   onAdd:(){
                                     cartController.add(cartController.data[index].id.toString(),
                                         cartController.data[index].quaintity.toString(),
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

                    ],),
                  ),

                ],
              ),)
      ),)

    );
  }
}
