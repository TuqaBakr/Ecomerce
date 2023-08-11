
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/modules/shop_app/home_screen/home_screen_controller.dart';
import 'package:weam/widget/custombuttomappbar.dart';
import '../../../constant.dart';
import '../../../routes.dart';

late bool active0=false , active1=false , active2=false , active3=false  ;

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp()) ;

    return GetBuilder<HomeScreenControllerImp>(builder: (controller) =>
        Scaffold(
          backgroundColor: whiteBackColor,
          floatingActionButton: FloatingActionButton(backgroundColor: secondBackColor ,
            onPressed: (){
             Get.toNamed(AppRoute.cart);
            },
             child:const Icon(Icons.shopping_basket_outlined),),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape:const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(
                    controller.listPage.length + 1,
                        (index) {
                          int i = index > 2 ? index - 1 : index;
                          return index == 2
                              ? const Spacer()
                              : CustomButtonAppBar(
                              textbutton: controller.bottomappbar[i]['title'],
                              iconData: controller.bottomappbar[i]['icon'],
                              onPressed: () {
                                controller.changePage(i);
                              },
                              active: controller.currentPage == i
                                  ? true
                                  : false);
                        })
              ],
            ),
        ),
          body: controller.listPage.elementAt(controller.currentPage),
    ) );
  }
}
