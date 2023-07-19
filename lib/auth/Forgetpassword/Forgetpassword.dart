import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class forgetpasswordData{
  Crud crud;
  forgetpasswordData(this.crud) ;
  postdata(String email) async {
    var response = await crud.postData(AppLink.forgetpassword,{
      "email": email,
    });
    return response.fold((l) => l, (r) => r) ;

  }
}