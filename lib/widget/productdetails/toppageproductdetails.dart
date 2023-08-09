
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/product_details/product_details_controller.dart';

import '../../constant.dart';
import '../../routes.dart';

class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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

    );
  }
}
