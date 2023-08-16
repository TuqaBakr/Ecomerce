import 'package:weam/class/crud.dart';
import 'package:weam/constant.dart';
import 'package:weam/routes.dart';


class OrderData {

  Crud crud;

  OrderData(this.crud);

  getData() async {
    print("hfhfhfh");
    var response = await crud.gettData(AppLink.vieworder, token);
    print("===========${response}");
    return response.fold((l) => l, (r) => r);
  }
}