import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:weam/modules/shop_app/logo/logo.dart';
import 'package:weam/modules/shop_app/setting/setting_controller.dart';
import 'package:weam/routes.dart';

import '../../../constant.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Container(
      color: whiteBackColor,
      child: ListView(
        children:[
          Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width/2.5,
              color: secondBackColor,
            ),
            Positioned (top: Get.width/3.5 , child:  Container(
              padding: EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                )
            ),),
          ],),
        SizedBox(height: 100,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Card(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                trailing: Switch(onChanged: (val){}, value: true,),
                title: Text("Dark mode"),
              ),
              Divider(),
              ListTile(
                onTap: (){
                        Get.offNamed(AppRoute.aboutas);
                },
                title: Text("About us"),
                trailing: Icon(Icons.help_center_outlined),
              ),
              Divider(),
              ListTile(
                onTap: (){
                  Get.offNamed(AppRoute.contactas);
                },
                title: Text("Contact us"),
                trailing: Icon(Icons.phone),
              ),
              Divider(),
              ListTile(
                onTap: (){
                   controller.logout();
                },
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
              ),
            ],),),
        ),
    ],),
    );
  }
}
