
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/widget/home/customappbar.dart';
import 'package:weam/widget/items/customlistitems.dart';
import 'package:weam/widget/items/listsubcategoriesitems.dart';

import '../../../constant.dart';
import 'items_controller.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(ItemsControllerImp());
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              CustomAppBar(
                  titleappbar: "Find Product", onPressedIcon: (){}, onPressedIconSearch: (){}),
              const SizedBox(height: 20,) ,
              const ListSubCategoriesItems() ,
              HandlingDataView(
                statusRequest: controller.statusRequestItems,
                widget:GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio:0.7, ),
                    itemBuilder: (BuildContext context, index) {
                      return CustomListItems(itemsModel: ItemsModel.fromJson(controller.products[index]),);
                     }),
              ),



              /*
              GridView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: controller.products.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio:0.7, ),
               itemBuilder: (BuildContext context, index){
                 return InkWell(
                   onTap: (){},
                   child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           //CachedNetworkImage(imageUrl: imageUrl),
                           Image.asset(
                               'assets/images/onboarding1.jpg'
                           ),
                           const Text(
                             "product title",
                             style: TextStyle(
                                 color: firstBackColor,
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold),
                           ),
                           const Text(
                             "description about my product pla pla",
                             textAlign: TextAlign.center,
                             style: TextStyle(color: secondBackColor),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               const Text(
                                  "200.0 \$",
                                  style: TextStyle(
                                    color: forthBackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                               IconButton(
                                   onPressed:(){},
                                   icon: const Icon(Icons.favorite_border_outlined, color: secondBackColor,)
                               ),
                             ],
                           ),

                         ],
                       ),
                     ),
                   ),

                 );
               }
              ),
              */
            ],

          ),
        ),
      ),
      ),
    );
  }
}
