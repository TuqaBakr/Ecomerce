
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/models/ordermoder.dart';
import 'package:weam/modules/shop_app/cart/cart.dart';
import 'package:weam/modules/shop_app/orders/order_controller.dart';

import '../../../constant.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      body: GetBuilder<OrderController>(builder:((controller)=> HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(
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
                    icon:const Icon(Icons.arrow_back),
                  ),
                )),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  child:const Text(
                    "My Order",
                    style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold, color: sevenBackColor, fontFamily: 'DeliciousHandrawn',
                    ),),
                )),
                const Spacer(),
              ],),),
          const SizedBox(height: 10,),
          ...List.generate(controller.data.length, (index) => CardOrderList(listdata: controller.data[index],))
        ],
      ))
          )));
  }
}

class CardOrderList extends GetView<OrderController> {
  final OrderModel listdata;
  const CardOrderList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding:const EdgeInsets.all(10) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               children: [
                 const Text("Order Number : ", style: TextStyle(
                  fontSize: 15,
            ),),
                 Text("${listdata.id}", style:const TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                 ),),
               ],
             ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.date_range, color:secondBackColor ),
                const SizedBox(width: 5,),
                Text("${listdata.orderDate}", style:
                const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: sevenBackColor
                ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.car_repair, color:secondBackColor ),
                const SizedBox(width: 5,),
                Text(controller.typeOrder(listdata.typeOrder.toString()), style:
                const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: sevenBackColor
                ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on, color:secondBackColor ),
                const SizedBox(width: 5,),

                Text("${listdata.address}", style:
                const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: sevenBackColor
                ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.how_to_vote_outlined, color:secondBackColor ),
                const SizedBox(width: 5,),
                Text(controller.PayMethod(listdata.orderPayment.toString()), style:
                const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: sevenBackColor
                ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.monetization_on_outlined, color:secondBackColor ),
                const SizedBox(width: 5,),

                Text("${listdata.orderPrice}\$", style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: forthBackColor
                ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

