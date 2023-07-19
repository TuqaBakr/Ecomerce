import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class registerData{
  Crud crud;
  registerData(this.crud) ;
  postdata(String name ,String password ,String email ,String phone) async {
    var response = await crud.postData(AppLink.register ,{
      "name": name ,
      "email": email,
      "phone": phone,
      "password": password,

    });
    return response.fold((l) => l, (r) => r) ;

  }
}