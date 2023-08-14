import 'package:weam/class/crud.dart';
import 'package:weam/constant.dart';
import 'package:weam/routes.dart';

class CartData{
  Crud crud;
  CartData(this.crud);

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

  getCountCart(int product_id)async{
    var response = await crud.gettData(
        AppLink.cartgetcountitems+"${product_id}",token
        );
    return response.fold((l) => l, (r) => r);
  }

  viewCart()async{
  var response = await crud.gettData(
      AppLink.cartview, token
      );
  return response.fold((l) => l, (r) => r);
}
}