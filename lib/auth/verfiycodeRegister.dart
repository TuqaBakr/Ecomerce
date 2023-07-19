import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class verfiycoderegisterData{
  Crud crud;
  verfiycoderegisterData(this.crud) ;
  postdata(String email ,String verfication_code) async {
    var response = await crud.postData(AppLink.verfiycoderegister,{
      "email": email,
      "verfication_code": verfication_code,
    });
    return response.fold((l) => l, (r) => r) ;

  }
}