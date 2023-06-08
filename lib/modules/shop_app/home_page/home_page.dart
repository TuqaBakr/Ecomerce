
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';

import '../../../constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp()) ;
    return Scaffold(
      body: Container(
        child:ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  /* Expanded(
                      child:/**/
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),

                  )),*/
                  Expanded(child:
                  Container(
                //margin: const EdgeInsets.all(15.0),
               // padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                      Radius.circular(17.0),),
                ),
               //  color: Colors.grey[200],
                    child: FormFeild(
                      valid: (val){
                        return validInput(val!, 8 , 20 , "Search");
                      },
                      labeltext: "",
                      iconData: Icons.search_outlined,
                      mycontroller: controller.search ,
                      hinttext: "Search Product",
                      isNumber: false,
                    ),
                  ),),
                  SizedBox(width: 10,),
                  Container(
                    width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                    Radius.circular(17.0),),
                    ),
                  child: IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.notifications_active_outlined),
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: secondBackColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
             // child: ListView.builder(itemBuilder: itemBuilder),
            ),
          ],
        ),
      )
    );
  }
}
