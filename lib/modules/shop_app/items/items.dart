
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/widget/home/customappbar.dart';
import 'package:weam/widget/items/customlistitems.dart';
import 'package:weam/widget/items/listsubcategoriesitems.dart';

import '../../../constant.dart';
import '../../../routes.dart';
import 'favorite_controller.dart';
import 'items_controller.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(ItemsControllerImp());
     FavoriteController favcontroller = Get.put(FavoriteController());
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              CustomAppBar(
                titleappbar: "Find Product".tr,
                onPressedIconSearch: (){
                  controller.onSearchItems();
                },
                mycontroller: controller.Search!,
                onChanged: (val){
                  controller.checkSearch(val) ;
                },
              ),
              !controller.isSearch
                  ? Column(children: [
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
                            if(favcontroller.isfavorite[controller.products[index]['id']] == null) {
                              favcontroller.setFavorite(controller.products[index]['id'], false) ;
                            }else{
                              print(favcontroller.isfavorite[controller.products[index]['id']]);
                            }
                          return CustomListItems(itemsModel: ItemsModel.fromJson(controller.products[index]), active: favcontroller.isfavorite[controller.products[index]['id']],);
                      }),
                ),
              ],)
                  : ListItemsSearch(listdataModel: controller.listdata)
            ],

          ),
        ),
      ),
      ),
    );
  }
}


class ListItemsSearch extends GetView<ItemsControllerImp> {
  final List<ItemsModel> listdataModel ;
  const ListItemsSearch({Key? key,required this.listdataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdataModel.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              controller.goToBrodactDetails(listdataModel[index].id!, listdataModel[index]) ;
            },
            child: Container(
              margin:const  EdgeInsets.symmetric(vertical: 10),
              child: Card(
                child: Container(
                  padding:const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                            imageUrl: AppLink.imageStatic + "${listdataModel[index].image}",
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          )
                      ),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdataModel[index].name!),
                            subtitle: Text(listdataModel[index].description!),
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
