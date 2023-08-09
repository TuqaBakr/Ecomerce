import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/home_page/home_page.dart';
import 'package:weam/modules/shop_app/setting/setting.dart';

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
    const Setting()

  ];

  List bottomappbar = [
    {"title" : "Home" , "icon":Icons.home},
    {"title" : "Profile" , "icon":Icons.person},
    {"title" : "Favorite" , "icon":Icons.favorite},
    {"title" : "Setting" , "icon":Icons.settings},
  ];



  @override
  changePage(int i) {
    currentPage = i ;
    update() ;
  }

}