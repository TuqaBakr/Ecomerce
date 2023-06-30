

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weam/bindings/initialbindings.dart';
//import 'package:weam/lucalization/changelocal.dart';
import 'package:weam/modules/profile/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weam/modules/shop_app/home_page/home_page.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';
import 'constant.dart';
import 'lucatization/changelocal.dart';
import 'lucatization/translatioin.dart';
import 'modules/shop_app/changeLang/changeLang.dart';
import 'modules/shop_app/forgetpassword/forgetpassword.dart';
import 'modules/shop_app/login_shop/login_shop.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'dart:io';

import 'modules/shop_app/register/register_shop.dart';
import 'modules/shop_app/register/successRegister.dart';
import 'modules/shop_app/register/verfiycoderegister.dart';
import 'modules/shop_app/resetPassword/resetPassword.dart';
import 'modules/shop_app/resetPassword/successReset.dart';
import 'modules/shop_app/verfiycode/verfiycode.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized() ;
  await initialServices() ;
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  late File image;
  final imagepicker = ImagePicker();

  uploadImage() async{
    var pickedImage = await imagepicker.getImage(source: ImageSource.camera);

  }

  @override
  Widget build(BuildContext context)
  {
    Get.put(LocaleController()) ;
    LocaleController controller = Get.find() ;
    return GetMaterialApp(
      translations: MyTranslation() ,
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      initialRoute:'/onBordingScreen' ,
      initialBinding: InitialBindings(),
       getPages: routes,

    );
  }

}









/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weam/modules/profile/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';
import 'constant.dart';
import 'lucatization/changelocal.dart';
import 'lucatization/translatioin.dart';
import 'modules/shop_app/changeLang/changeLang.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await initialServices() ;
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  late File image;
  final imagepicker = ImagePicker();

  uploadImage() async{
    var pickedImage = await imagepicker.getImage(source: ImageSource.camera);

  }

  @override
  Widget build(BuildContext context)
  {
    Get.put(LocaleController()) ;
    LocaleController controller = Get.find() ;
    return GetMaterialApp(
      translations: MyTranslation() ,
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      home: Language(),
      routes: routes,
    );
  }
}
*/