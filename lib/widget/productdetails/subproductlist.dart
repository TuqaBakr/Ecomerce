
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/modules/shop_app/product_details/product_details_controller.dart';

import '../../constant.dart';

class SubProduct extends GetView<ProductDetailsControllerImp>{
  const SubProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Row(
            children: [
              ...List.generate(controller.attribute.length, (index) => Row(
                children: const [
                  //const Icon(Icons.color_lens_outlined,),
                  SizedBox(width: 15,),
                  Icon(Icons.color_lens, color: secondBackColor,size: 30,),
                  //Text("${controller.attribute[index]['color']}" + "   " + "${controller.attribute[index]['size']}" + "   " + "${controller.attribute[index]['price']}" )
                ],
              ),),
              ...List.generate(controller.attribute.length, (index) => Row(
                children: [
                  Container(
                    child:const Text("Count: 11 piece", style: TextStyle(color:firstBackColor ), ),
                    padding:const EdgeInsets.only(left: 15),
                  ),
                ],
              ),),
            ],
          ),
        ),
      );





  }
}
