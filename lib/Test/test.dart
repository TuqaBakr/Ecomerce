import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';


class TestData {

  Crud crud;

  TestData(this.crud);

  getData() async {
    print("hfhfhfh");
    var response = await crud.getData(AppLink.getCategory);
    print("===========${response}");
    return response.fold((l) => l, (r) => r);
  }
}