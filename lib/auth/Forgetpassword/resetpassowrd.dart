import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class resetpasswordData{
  Crud crud;
  resetpasswordData(this.crud) ;
  postdata(String email , String password) async {
    var response = await crud.postData(AppLink.resetpassword,{
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r) ;

  }
}