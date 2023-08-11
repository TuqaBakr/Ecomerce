
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/modules/shop_app/product_details/product_details_controller.dart';

import '../../constant.dart';

class SubProduct extends GetView<ProductDetailsControllerImp>{

   SubProduct( {Key? key  ,}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              Row(
                children: [
                  ...List.generate(controller.attribute.length, (index) => Column(
                    children:[
                      //const Icon(Icons.color_lens_outlined,),
                      IconButton(
                          onPressed: (){
                            //print("7777777777777777888888888888888888");
                          },
                          icon:  Icon(Icons.color_lens, color: secondBackColor ,size: 30, ),),

                      const SizedBox(width: 20,),
                      Container(
                        child: Text(
                          "${controller.attribute[index]["quaintity"]}",
                          style: TextStyle(color:firstBackColor ), ),
                          padding:const EdgeInsets.only(left: 15),
                      ),
                    ],
                  ),),
                ],
              ),

            ],
          )

        ),
      );





  }
}
