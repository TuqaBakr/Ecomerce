// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weam/constant.dart';
import 'package:weam/models/categoreismodel.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';

import '../../routes.dart';

class ListHighRatingItemsHome extends GetView<HomeControllerImp> {

  const ListHighRatingItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 100,
      child: ListView.builder(
          itemCount: controller.highestProducts.length,
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
        controller.goToProductDetails(itemsModel.id!) ;
      },
      child:Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal:10 ,vertical: 15),
            child: Image.network(
              AppLink.imageStatic + "${itemsModel.image}" ,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
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
        ],
      ),
    );;
  }
}