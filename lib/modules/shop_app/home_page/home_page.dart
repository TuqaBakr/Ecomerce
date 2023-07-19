
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';
import 'package:weam/routes.dart';
import 'package:weam/widget/home/customappbar.dart';
import 'package:weam/widget/home/listHratingitems.dart';
import 'package:weam/widget/home/listcategorieshome.dart';
import 'package:weam/widget/home/listdiscountitemshome.dart';

import '../../../constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp()) ;
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget:Container(
            padding: const EdgeInsets.all(15.0),
            child:ListView(
              children: [
                CustomAppBar(
                    titleappbar: "Find Product", onPressedIcon: (){}, onPressedIconSearch: (){}),

                const SizedBox(height: 10,),

                //new offer
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child:  ListTile(
                        title: Text("A summer surprice",
                            style: TextStyle(color: fifthBackColor.withOpacity(0.7), fontSize:25, fontFamily: 'DeliciousHandrawn',)
                        ),
                        subtitle: Text(
                            "Cast back 20%",
                            style: TextStyle(
                              color: fifthBackColor.withOpacity(0.5),
                              fontSize:20,
                              fontFamily: 'DeliciousHandrawn',)),
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                        color: secondBackColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      right: controller.lang == "en" ?  -50 : null,
                      left: controller.lang == "ar" ?  -50 : null,
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: sevenBackColor,
                          borderRadius:BorderRadius.circular(160),
                        ),

                      ),
                    ),
                  ],
                ),

                Container(
                  margin:const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    "Categories:",
                    style: TextStyle(
                      color: firstBackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold ,
                    ),
                  ),
                ),

                const ListCategoriesHome() ,

                Container(
                  margin:const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "Discount Products:",
                    style: TextStyle(
                      color: firstBackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ListDiscountItemsHome(),
                /*
                SizedBox(
                  height: 200,
                  width: 100,
                  child: ListView.builder(
                      itemCount: controller.discountProducts.length,
                      scrollDirection: Axis.horizontal ,
                      itemBuilder: (context, i){
                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 10),
                              margin: const EdgeInsets.symmetric(horizontal:10 ,vertical: 15),
                              child: Image.network(
                                AppLink.imageStatic + "${controller.discountProducts[i]['image']}" ,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color:fifthBackColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              height: 170,
                              width: 170,
                            ),
                             Positioned(
                                 top: 2,
                                left:10,
                                child: Text(
                                  "${controller.discountProducts[i]['name']}",
                                  style:const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)
                                  ,)),
                          ],
                        );
                      }
                  ),
                ),
                */

                Container(
                  margin:const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "High Rating Product:",
                    style: TextStyle(
                      color: firstBackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ListHighRatingItemsHome(),
              ],
            ),
          ),
        ),
      );
  }
}
