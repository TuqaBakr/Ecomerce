 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/Test/test_controller.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/class/statusrequest.dart';

import '../constant.dart';
class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController()) ;
    return Scaffold(
      backgroundColor: thirdBackColor,
      appBar: AppBar(
        title: const Text("tittle "),
        backgroundColor: firstBackColor,
      ),
        body: GetBuilder<TestController>(builder: (controller){

          return HandlingDataView(
              statusRequest:controller.statusRequest ,
              widget:ListView.builder(
                  itemCount:controller.data.length ,
                  itemBuilder: (context, index)
                  {
                    return Text("${controller.data}") ;
                  }));
        }),
    );
  }
}
