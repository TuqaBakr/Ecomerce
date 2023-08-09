
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/constant.dart';
import 'package:weam/models/productmodel.dart';
import 'package:weam/widget/productdetails/priceandcount.dart';
import 'package:weam/widget/productdetails/subproductlist.dart';
import 'package:weam/widget/productdetails/toppageproductdetails.dart';

import '../../../routes.dart';
import 'product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp()) ;
    return Scaffold(
      bottomNavigationBar: Container(
        margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 50,
        child: MaterialButton(
          onPressed: (){},
          child:Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Row(children: const[
              Text('Add to cart', style: TextStyle(fontWeight: FontWeight.bold, color: whiteBackColor),),
              Icon(Icons.add_shopping_cart_outlined, color: whiteBackColor),
            ],),
          ),

          color: secondBackColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      body:Container(
        child:ListView(
          children:
          [
            const TopPageProductDetails(),
            /*
            Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 200,
                        decoration:const BoxDecoration(
                          color: secondBackColor,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                        ),
                      ),
                      Positioned(
                        child: Hero(
                          tag:"${controller.itemsModel.id}",
                          child: CachedNetworkImage(
                            imageUrl: AppLink.imageStatic + "${controller.itemsModel.image}",
                            height:  Get.width /1.5,
                            width:  Get.width ,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                        top: Get.width /6,
                        left: Get.width /5,
                        right: Get.width /5,
                      )
                    ],

                ),
            */
            const SizedBox(
              height: 120,
            ),

            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${controller.itemsModel.name}",
                      style:Theme.of(context).textTheme.headline3!.copyWith(color: firstBackColor),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  PriceAndCount(onAdd: (){},onRemove: (){},count: "10",price: "200",),

                  const SizedBox(height: 20,),
                  Text(
                    "About Product:",
                    style:Theme.of(context).textTheme.headline6!.copyWith(color: firstBackColor),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "${controller.itemsModel.description}""${controller.itemsModel.description}""${controller.itemsModel.description}""${controller.itemsModel.description}""${controller.itemsModel.description}",
                    style:Theme.of(context).textTheme.bodyText2!.copyWith(color: firstBackColor),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Details :",
                    style:Theme.of(context).textTheme.headline6!.copyWith(color: firstBackColor),
                  ),
                  const SizedBox(width: 10,),
                  const SubProduct(),
                ],

                        ),
                      ),
        ],
                  ),
              ),
            );
  }
}


