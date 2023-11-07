import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/modules/shop_app/favorite/myfavorite_controller.dart';
import 'package:weam/routes.dart';
import 'package:weam/widget/home/customappbar.dart';
import 'package:weam/widget/myfavorite/customlistfavoriteitems.dart';

import '../../../constant.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyFavoriteController cartController = Get.put(MyFavoriteController());

    return Scaffold(
      body: GetBuilder<MyFavoriteController>(
        builder: ((controller) => ListView(
          children: [
            const SizedBox(height: 15,),
            //topAppBar
            Container(
              alignment: Alignment.center,
              child:Row(
                children: [
                  Expanded(child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon:const Icon(Icons.arrow_back),
                    ),
                  )),
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "My Favorite".tr,
                      style:const TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, color: sevenBackColor, fontFamily: 'DeliciousHandrawn',
                      ),),
                  )),
                  const Spacer(),
                ],),),
            const SizedBox(height: 10,),
            Container(
              color: whiteBackColor,
              padding:const EdgeInsets.all(8),
              child: Column(
                children: [
                  ...List.generate(
                      controller.data.length,
                          (index) => CustomListFavoriteItems(
                        name:"${cartController.data[index].name}",
                        price:"${cartController.data[index].price}",
                        image:"${cartController.data[index].image}",)
                  )

                  /*
                      ...List.generate(
                          cartController.data.length,
                               (index) => CustomCartList(
                                   onAdd:(){
                                     cartController.add(cartController.data[index].id.toString(),
                                         cartController.data[index].quaintity!,
                                         "blue",);
                                     //
                                     // cartController.refreshPage();
                                   } ,
                                   onRemove: (){
                                     cartController.delete(cartController.data[index].id.toString(),
                                       cartController.data[index].quaintity.toString(),
                                       "blue",);
                                    // cartController.refreshPage();
                                   },
                                   name:"${cartController.data[index].name}",
                                   price:"${cartController.data[index].price}",
                                   image:"${cartController.data[index].image}",
                                   count: "${cartController.data[index].quaintity}",))
                        */

                ],),
            ),

          ],
        )
        ),
      )
    );
  }
}
