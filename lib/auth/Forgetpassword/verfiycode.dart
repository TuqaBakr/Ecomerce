import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class verfiycodeData{
  Crud crud;
  verfiycodeData(this.crud) ;
  postdata(String email , String code) async {
    var response = await crud.postData(AppLink.checkcode,{
      "email": email,
      "code": code,
    });
    return response.fold((l) => l, (r) => r) ;

  }
}