import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/Test/test_controller.dart';
import 'package:weam/class/statusrequest.dart';
class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController()) ;
    return Scaffold(
      appBar: AppBar(title: Text("titile"),),
      /*body: GetBuilder<TestController>(builder: (controller){
        if(controller.statusReqest == StatusReqest.loading)
      };,),
    */
    );
  }
}
