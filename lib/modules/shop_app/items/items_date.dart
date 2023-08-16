
import 'package:get/get.dart';
import 'package:weam/class/crud.dart';
import 'package:weam/constant.dart';
import 'package:weam/modules/shop_app/items/items_controller.dart';

import '../../../routes.dart';

class ItemData{
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

  //for delete and add to favorite
  postData( String link, product_id) async {
    print("hfhfhfh");
    // String link = "${AppLink.subcategories}""${i}";
    // print(link) ;
    var response = await crud.postData(link, {"token" : token.toString(), "product_id" : product_id.toString()});
    print(link +"=========== ${response}");
    return response.fold((l) => l, (r) => r) ;

  }

  searchData(String search) async {
    print("hfhfhfh");
    String link = "${AppLink.searchItems}""${search}";
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