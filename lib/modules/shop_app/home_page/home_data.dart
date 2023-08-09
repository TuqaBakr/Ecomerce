import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';

//import '../../../test.dart';

class HomeData{

  Crud crud;

  HomeData(this.crud) ;

  getData() async {
    print("hfhfhfh");
    var response = await crud.getData(AppLink.homepage);
    print("===========${response}");
    return response.fold((l) => l, (r) => r) ;
  }
  searchData(String search) async {
    print("hfhfhfh");
    String link = "${AppLink.searchItems}""${search}";
    // print(link) ;
    var response = await crud.getData(link);
    print(link +"=========== ${response}");
    return response.fold((l) => l, (r) => r) ;

  }
}