import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/about_as.dart';
import 'package:weam/modules/shop_app/changeLang/changeLang.dart';
import 'package:weam/modules/shop_app/forgetpassword/forgetpassword.dart';
import 'package:weam/modules/shop_app/home_page/home_page.dart';
import 'package:weam/modules/shop_app/home_screen/home_screen.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/modules/shop_app/product_details/product_details.dart';
import 'package:weam/modules/shop_app/register/successRegister.dart';
import 'package:weam/modules/shop_app/resetPassword/successReset.dart';
import 'Test/test_view.dart';
import 'modules/shop_app/cart/cart.dart';
import 'modules/shop_app/contact_as.dart';
import 'modules/shop_app/items/items.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'modules/shop_app/register/register_shop.dart';
import 'modules/shop_app/register/verfiycoderegister.dart';
import 'modules/shop_app/resetPassword/resetPassword.dart';
import 'modules/shop_app/verfiycode/verfiycode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: ()=> HomeScreen()),
  GetPage(name: AppRoute.cart, page: ()=> const Cart()),
  GetPage(name: AppRoute.testView, page: ()=>const TestView()),
  GetPage(name: AppRoute.language, page: ()=> Language()),
  GetPage(name: AppRoute.onBoardingScreen, page: ()=> OnBoardingScreen()),
  GetPage(name: AppRoute.loginShop, page: ()=>const loginShop()),
  GetPage(name: AppRoute.registerShop, page: ()=>const registerShop()),
  GetPage(name: AppRoute.forgetPassword, page: ()=> const forgetPassword()),
  GetPage(name: AppRoute.verfiycode, page: ()=>const verfiycode()),
  GetPage(name: AppRoute.resetPassword, page: ()=>  const resetPassword()),
  GetPage(name: AppRoute.successReset, page: ()=>const successReset()),
  GetPage(name: AppRoute.successRegister, page: ()=>  const successRgister()),
  GetPage(name: AppRoute.verficoderegister, page: ()=>const verfiycoderegister()),
  GetPage(name: AppRoute.homePage, page: ()=> HomeScreen()),
  GetPage(name: AppRoute.items, page: ()=> Items()),
  GetPage(name: AppRoute.productDetails, page: ()=>const ProductDetails()),
  GetPage(name: AppRoute.aboutas, page: ()=>About_as()),
  GetPage(name: AppRoute.contactas, page: ()=>ContactUs()),

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
  static const String language = "/language";
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
  static const String items = "/items";
  static const String productDetails = "/productDetails";
  static const String cart = "/cart";
  static const String aboutas = "/aboutas";
  static const String contactas = "/contactas";
}

class AppLink{
  //=======================server=================== 192.168.241.203
  static const String server = "http://192.168.241.203:8000/api" ;
  static const String test = "https://jsonplaceholder.typicode.com/posts" ;

  //=========================== home page ============
  // ignore: constant_identifier_names0
  static String getCategory = "$server/viewcatigory" ;
  static String getCat = "http://192.168.241.203:8000/api/viewcatigory" ;
  static String homepage = "$server/homepage" ;

  //====================images============================

  static const String imageStatic = "http://192.168.241.203:8000/" ;
  static const String categoryImage = "C:/xampp/htdocs/shopping/public/photos" ;
  static const String subcategoryImage = "C:/xampp/htdocs/shopping/public/subcatigory" ;
  static const String productImage = "C:/xampp/htdocs/shopping/public/products " ;


  //=========================== Auth =================
  static String register = "$server/regiser" ;
  static String verfiycoderegister = "$server/checkcode" ;
  static String login = "$server/login" ;

//=========================== ForgetPassword ============

  static String forgetpassword = "$server/user/password/email" ;
  static String checkcode = "$server/user/password/code/check" ;
  static String resetpassword = "$server/user/password/reset" ;


//=========================== subcategories ============
static String subcategories = "$server/viewsubcatigory/" ;


//=========================== items ============
  static String products = "$server/viewproducts/" ;
  static String productsDetails = "$server/productinfo/" ;
  static String searchItems = "$server/searchbyname/" ;



//=================== Search =======================


// ========================== cart =======================
  static String cartview = "$server/cart " ;
  static String cartadd = "$server/add/cart" ;
  static String cartdelete = "$server/remove/cart " ;
  static String cartgetcountitems = "$server/count/product/" ;

}

class AppImageAsset{
  static  String loading4 = "assets/lottie/loading4.json";
  static const String offline="assets/lottie/offline.json";
  static const String serverFailure="assets/lottie/server_failure.json";
  static const String noData="assets/lottie/nodata.json";
}