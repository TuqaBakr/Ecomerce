import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';

class CartData{
  Crud crud;
  CartData(this.crud);

  addCart(String token , String product_id, String quaintity, String color)async{
    var response = await crud.postData(
    AppLink.cartadd,
    {
      "token"     :token  ,
      "product_id":product_id ,
      "quaintity" : quaintity ,
      "color"     :color

    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String token , String product_id)async{
    var response = await crud.postData(
        AppLink.cartdelete,
        {
          "product_id":product_id ,
          "token":token,
        });
    return response.fold((l) => l, (r) => r);
}

  getCountCart(String token , String product_id)async{
    var response = await crud.gettData(
        AppLink.cartgetcountitems+"${product_id}",  token
        );
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String token )async{
  var response = await crud.gettData(
      AppLink.cartview, token
      );
  return response.fold((l) => l, (r) => r);
}
}