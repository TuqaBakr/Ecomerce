
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';
import 'package:weam/routes.dart';
import 'package:weam/widget/home/customappbar.dart';
import 'package:weam/widget/home/listcategorieshome.dart';

import '../../../constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp()) ;
    return GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:  Container(
            padding: const EdgeInsets.all(15.0),
            child:ListView(
              children: [
                CustomAppBar(
                    titleappbar: "Find Product", onPressedIcon: (){}, onPressedIconSearch: (){}),

                //new offer
                Container(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const ListTile(
                          title: Text("A summer surprice",
                              style: TextStyle(color: fifthBackColor, fontSize:25, fontFamily: 'DeliciousHandrawn',)
                          ),
                          subtitle: Text("Cast back 20%", style: TextStyle(color: fifthBackColor, fontSize:20, fontFamily: 'DeliciousHandrawn',)),
                        ),
                        height: 150,
                        decoration: BoxDecoration(
                          color: secondBackColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        right: -50,
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
                ),

                SizedBox(height: 15,),
                Container(
                  child: const Text(
                    "Categories:",
                    style: TextStyle(
                      // fontFamily: 'DeliciousHandrawn',
                      color: firstBackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold ,
                    ),
                  ),
                ),

                const SizedBox(height: 15,),

                const ListCategoriesHome() ,
                
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                const Text(
                  "Products For You:",
                  style: TextStyle(
                    // fontFamily: 'DeliciousHandrawn',
                    color: firstBackColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                SizedBox( 
                  height: 200,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal ,
                      itemBuilder: (context, i){
                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 10),
                              margin: const EdgeInsets.symmetric(horizontal:10 ),
                              child: Image.asset('assets/images/onboarding1.jpg' , height: 150, width: 150, fit: BoxFit.fill,),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              height: 150,
                              width: 170,
                            ),
                            Positioned(
                                left:10,
                                child: Text("laptop service " , style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold) ,)),
                          ],
                        );
                      }
                  ),
                ),
                
                const Text(
                   "Popular Now:",
                   style: TextStyle(
                     color: firstBackColor,
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal ,
                      itemBuilder: (context, i){
                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 10),
                              margin: const EdgeInsets.symmetric(horizontal:10 ),
                              child: Image.asset('assets/images/onboarding1.jpg' , height: 150, width: 150, fit: BoxFit.fill,),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              height: 150,
                              width: 170,
                            ),
                            const Positioned(
                                left:10,
                                child: Text("laptop service " , style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold) ,)),
                          ],
                        );
                      }
                  ),
                )
              ],
            ),
          ),
          ),
      );
  }
}
