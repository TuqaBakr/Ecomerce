
import 'package:get/get.dart';
import 'package:weam/class/crud.dart';
import 'package:weam/modules/shop_app/items/items_controller.dart';

import '../../../routes.dart';

class ProductData{
  //ItemsControllerImp controller = Get.find();
  // final ItemsControllerImp controller;
  //ItemData(this.controller);
  Crud crud;

  ProductData(this.crud) ;

  getData( String link) async {

    print("hfhfhfh");
    // String link = "${AppLink.subcategories}""${i}";
    // print(link) ;
    var response = await crud.getData(link);
    print(link +"=========== ${response}");
    return response.fold((l) => l, (r) => r) ;

  }
}