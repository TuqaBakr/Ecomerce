
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weam/constant.dart';
import 'package:weam/models/categoreismodel.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';

import '../../routes.dart';

class ListDiscountItemsHome extends GetView<HomeControllerImp> {

  const ListDiscountItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      //width: 100,
      child: ListView.builder(
          itemCount: controller.discountProducts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return Products(
              i : index,
              itemsModel: ItemsModel.fromJson(controller.highestProducts[index]),);
          }
      ),
    ) ;
  }
}

class Products extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel ;
  final int? i ;
  const Products( {Key? key, required this.itemsModel ,required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToProductDetails(itemsModel.id!, itemsModel) ;
        //controller.goToBrodactDetails(itemsModel.id!, itemsModel) ;
      },
      child:Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal:10 ,vertical: 15),
            child: Hero(
              tag: "${itemsModel.id!}",
              child: CachedNetworkImage(
                imageUrl: AppLink.imageStatic + itemsModel.image!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
                color:fifthBackColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)
            ),
            height: 170,
            width: 170,
          ),
          Positioned(
              top: 2,
              left:10,
              child: Text(
                "${itemsModel.name}",
                style:const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)
                ,)),
          Positioned(
              right:1,
              top: 1,
              child: Image.asset("assets/images/sallle.png", width: 45,)),
        ],

      ),
    );
  }
}