import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/home_page/home_page.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentpage) ;

}

class HomeScreenControllerImp extends HomeScreenController{

  int currentPage = 0;

  List<Widget> listPage =[
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
        Center(child: Text("profile"))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
        Center(child: Text("Favorite"))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
        Center(child: Text("Setting"))
      ],
    ),

  ];

  List titlebottomappbar = [
    "Home",
    "Profile",
    "Favorite",
    "Setting",

  ];

  List<IconData> Iconbottomappbar = [
    Icons.home,
    Icons.person,
    Icons.favorite,
    Icons.settings
  ];


  @override
  changePage(int i) {
    currentPage = i ;
    update() ;
  }

}