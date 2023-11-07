import 'package:weam/class/crud.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/constant.dart';

import '../../../routes.dart';

class MyFavoriteData{

  Crud crud;

  MyFavoriteData(this.crud) ;


  //favorit
  addfavorite(String product_id)async{
    var response = await crud.postData(
        AppLink.addfav,
        {
          "token"      : token ,
          "product_id" : product_id  ,
        });
    return response.fold((l) => l, (r) => r);
  }
  deletefavorite(String product_id)async{
    var response = await crud.postData(
        AppLink.deletefav,
        {
          "token"      : token ,
          "product_id" : product_id  ,
        });
    return response.fold((l) => l, (r) => r);
  }

  viewfavorite() async {
    print("hfhfhfh");
    var response = await crud.gettData(AppLink.viewfav, token);
    print("===========${response}");
    return response.fold((l) => l, (r) => r);
  }

}