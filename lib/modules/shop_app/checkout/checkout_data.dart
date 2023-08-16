import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class CheckoutData {

  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data) async {
    print("hfhfhfh");
    var response = await crud.postData(AppLink.checkout, data);
    print("===========${response}");
    return response.fold((l) => l, (r) => r);
  }
}