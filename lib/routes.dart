import 'package:flutter/material.dart';
import 'package:weam/modules/shop_app/forgetpassword/forgetpassword.dart';
import 'package:weam/modules/shop_app/home_page/home_page.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/register/successRegister.dart';
import 'package:weam/modules/shop_app/resetPassword/successReset.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'modules/shop_app/register/register_shop.dart';
import 'modules/shop_app/register/verfiycoderegister.dart';
import 'modules/shop_app/resetPassword/resetPassword.dart';
import 'modules/shop_app/verfiycode/verfiycode.dart';

Map<String, Widget Function(BuildContext)> routes = {
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

class AppRoute {
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
  static const String server = "https://wael.com/ecomerce" ;
  static const String test = "$server/test.php" ;
}