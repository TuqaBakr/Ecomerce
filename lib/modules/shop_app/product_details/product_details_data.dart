
import 'package:get/get.dart';
import 'package:weam/class/crud.dart';
import 'package:weam/constant.dart';
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

  getCountCart(String product_id)async{
    var response = await crud.gettData(
        AppLink.cartgetcountitems + product_id,token
    );
    return response.fold((l) => l, (r) => r);
  }

  addCart(String token , String product_id, int quaintity, String color)async{
    var response = await crud.postData(
        AppLink.cartadd,
        {
          "token"     :token  ,
          "product_id":product_id ,
          "quaintity" : quaintity.toString() ,
          "color"     :color

        });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String token , String product_id, String quaintity, String color)async{
    var response = await crud.postData(
        AppLink.cartdelete,
        {
          "product_id":product_id ,
          "token"     :token  ,
          "color"     :color,
          "quaintity" : quaintity ,
        });
    print("23212777777as$response");
    return response.fold((l) => l, (r) => r);
  }
}