import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:weam/class/crud.dart';
import 'package:weam/constant.dart';

import '../../../routes.dart';

class SettingData {
  Crud crud;
  SettingData(this.crud);



  logoutdata()async{
    var response = await crud.gettData(
        AppLink.logout,token
    );
    return response.fold((l) => l, (r) => r);
  }
}