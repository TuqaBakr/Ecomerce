
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weam/constant.dart';
import 'package:weam/models/attributemodel.dart';
import 'package:weam/models/categoreismodel.dart';
import 'package:weam/models/subcategories.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';
import 'package:weam/modules/shop_app/items/items_controller.dart';
import 'package:weam/modules/shop_app/product_details/product_details_controller.dart';

class ListAttribute extends GetView<ProductDetailsControllerImp> {

  const ListAttribute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context , index) =>const SizedBox(width: 10,),
          itemCount: controller.attribute.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return Attribute(
              i : index,
              attributeModel : AttributeModel.fromJson(controller.attribute[index]),);
          }
      ),
    ) ;
  }
}

class Attribute extends GetView<ItemsControllerImp> {
  final AttributeModel attributeModel ;
  final int? i ;
  const Attribute({Key? key ,required this.attributeModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // controller.goToItems(controller.categories, i! ) ;
      //  controller.changeSubCat(i!, subcategoriesModel.id!) ;
        //controller.subId = subcategoriesModel.id!.toString() ;
      },
      child: Column(
        children: [
          const SizedBox(height: 10,),
          GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                /*decoration:controller.selectedSub == i ?const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 3,
                          color: secondBackColor)),
                ) : null,*/
                child: Text(
                  "${attributeModel.color}",
                  style:const TextStyle(
                      fontSize: 17,
                      color: secondBackColor),
                ),
              ) )
        ],
      ),
    );
  }
}