
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weam/constant.dart';
import 'package:weam/models/categoreismodel.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {

  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context , index) =>const SizedBox(width: 10,),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return Categories(
              i : index,
              categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);
          }
      ),
    ) ;
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel ;
  final int? i ;
  const Categories( {Key? key, required this.categoriesModel ,required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories, i! ) ;
      },
      child: Column(
        children: [
          Container(
            child: SvgPicture.network("http://192.168.1.103:8000/""${categoriesModel.image}", color: sevenBackColor,),
            padding:const EdgeInsets.symmetric(horizontal: 10) ,
            height: 60 ,
            width: 100,
            decoration: BoxDecoration(
              color: whiteBackColor,
              borderRadius:BorderRadius.circular(15),
            ),
          ),
           const SizedBox(height: 10,),
          Text("${categoriesModel.name}", style:const TextStyle(fontSize: 10, color: secondBackColor),) ,
        ],
      ),
    );;
  }
}