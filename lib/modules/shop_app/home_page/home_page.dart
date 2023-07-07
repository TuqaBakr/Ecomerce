
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';

import '../../../constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp()) ;
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget:  Container(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child:ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(child:
                      Container(
                        //margin: const EdgeInsets.all(15.0),
                        // padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(17.0),),
                        ),
                        child: FormFeild(
                          valid: (val){
                            return validInput(val!, 8 , 20 , "Search");
                          },
                          labeltext: "",
                          iconData: Icons.search_outlined,
                          mycontroller: controller.search,
                          hinttext: "Search Product",
                          isNumber: false,
                        ),
                      ),),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(17.0),),
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.notifications_active_outlined),
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const ListTile(
                          title: Text("A summer surprice", style: TextStyle(color: fifthBackColor, fontSize:25, fontFamily: 'DeliciousHandrawn',)),
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

          Container(
            height: 60,
              child: ListView.separated(
                separatorBuilder: (context , index) => SizedBox(width: 10,),
                itemCount: 10, //controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10) ,
                      height: 30 ,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:BorderRadius.circular(15),
                      ),
                    );
                  }
              ),
            ),

              ],
            ),
          ),
          ),
      ),
    );
  }
}
