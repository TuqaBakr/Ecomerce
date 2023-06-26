 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/Test/test_controller.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/class/statusrequest.dart';
class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController()) ;
    return Scaffold(
      appBar: AppBar(title: const Text("tittle "),),
        body: GetBuilder<TestController>(builder: (controller){

          return HandlingDataView(
              statusReqest:controller.statusReqest ,
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
