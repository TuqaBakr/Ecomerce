
import 'package:get/get.dart';
import 'package:weam/class/crud.dart';
import 'package:weam/modules/shop_app/items/items_controller.dart';

import '../../../routes.dart';

class ItemData{
  //ItemsControllerImp controller = Get.find();
 // final ItemsControllerImp controller;
  //ItemData(this.controller);
  Crud crud;

  ItemData(this.crud) ;

  getData( String link) async {

    print("hfhfhfh");
   // String link = "${AppLink.subcategories}""${i}";
   // print(link) ;
    var response = await crud.getData(link);
    print(link +"=========== ${response}");
    return response.fold((l) => l, (r) => r) ;

  }

/*
  getItems(int i) async {

    print("hfhfhfh");
    String link = "${AppLink.getItems}""${i}";
    print(link) ;
    var response = await crud.getData("${AppLink.getItems}""${i}");
    print(link +"===========${response}");
    return response.fold((l) => l, (r) => r) ;

  }

  */
}