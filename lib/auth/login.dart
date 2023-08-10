import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class loginData{
  Crud crud;
  loginData(this.crud) ;
  postdata(String email , String password) async {
    var response = await crud.postData(AppLink.login,
        {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r) ;

  }
}