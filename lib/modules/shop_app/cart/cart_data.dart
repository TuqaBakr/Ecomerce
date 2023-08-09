import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  addCart(String usersid , String itemsid)async{
    var response = await crud.postData(
    AppLink.cartadd,
    {"usersid":usersid , "itemsid":itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid , String itemsid)async{
    var response = await crud.postData(
        AppLink.cartdelete,
        {"usersid":usersid , "itemsid":itemsid});
    return response.fold((l) => l, (r) => r);
}
}