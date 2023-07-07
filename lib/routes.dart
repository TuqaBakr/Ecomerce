import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/forgetpassword/forgetpassword.dart';
import 'package:weam/modules/shop_app/home_page/home_page.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/register/successRegister.dart';
import 'package:weam/modules/shop_app/resetPassword/successReset.dart';
import 'Test/test_view.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'modules/shop_app/register/register_shop.dart';
import 'modules/shop_app/register/verfiycoderegister.dart';
import 'modules/shop_app/resetPassword/resetPassword.dart';
import 'modules/shop_app/verfiycode/verfiycode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: ()=>   TestView()),
  GetPage(name: AppRoute.testView, page: ()=> TestView()),
  GetPage(name: AppRoute.onBoardingScreen, page: ()=> OnBoardingScreen()),
  GetPage(name: AppRoute.loginShop, page: ()=>const loginShop()),
  GetPage(name: AppRoute.registerShop, page: ()=>const registerShop()),
  GetPage(name: AppRoute.forgetPassword, page: ()=> const forgetPassword()),
  GetPage(name: AppRoute.verfiycode, page: ()=>const verfiycode()),
  GetPage(name: AppRoute.resetPassword, page: ()=>  const resetPassword()),
  GetPage(name: AppRoute.successReset, page: ()=>const successReset()),
  GetPage(name: AppRoute.successRegister, page: ()=>  const successRgister()),
  GetPage(name: AppRoute.verficoderegister, page: ()=>const verfiycoderegister()),
  GetPage(name: AppRoute.homePage, page: ()=> HomePage()),

];




/*Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.onBoardingScreen : (context) => OnBoardingScreen(),
  AppRoute.loginShop : (context) => const loginShop(),
  AppRoute.registerShop : (context) => const registerShop(),
  AppRoute.forgetPassword : (context) => const forgetPassword(),
  AppRoute.verfiycode : (context) => const verfiycode(),
  AppRoute.resetPassword : (context) => const resetPassword(),
  AppRoute.successReset : (context) => const successReset(),
  AppRoute.successRegister : (context) => const successRgister(),
  AppRoute.verficoderegister : (context) => const verfiycoderegister(),
  AppRoute.homePage : (context) =>const HomePage(),

};
*/
class AppRoute {
  static  String testView = "/testView";
  static const String onBoardingScreen = "/onBordingScreen";
  static const String loginShop = "/loginShop";
  static const String registerShop = "/registerShop";
  static const String forgetPassword = "/forgetpassword";
  static const String verfiycode = "/verfiycode";
  static const String resetPassword = "/resetpassword";
  static const String successReset = "/successreset";
  static const String successRegister = "/successregister";
  static const String verficoderegister = "/verficoderegister";
  static const String homePage = "/homePage";

}

class AppLink{
  //=======================server===================
  static const String server = "http://192.168.1.112:8000/api" ;
  static const String test = "https://jsonplaceholder.typicode.com/posts" ;

  //=========================== home page ============
  // ignore: constant_identifier_names
  static String getCategory = "$server/viewcatigory" ;
  static String getCat = "$server/viewcatigory" ;
  static String homepage = "$server/homepage" ;

}