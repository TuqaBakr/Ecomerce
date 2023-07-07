import 'package:weam/class/crud.dart';
import 'package:weam/routes.dart';

//import '../../../test.dart';

class HomeData{

  Crud crud;

  HomeData(this.crud) ;
  getData() async {
    var response = await crud.getData(AppLink.getCategory);
    response.fold((l) => l, (r) => r) ;

  }
}