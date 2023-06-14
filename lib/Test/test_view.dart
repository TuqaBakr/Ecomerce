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
      appBar: AppBar(title: const Text("tittle "),),
        body: GetBuilder<TestController>(builder: (controller){
        if(controller.statusReqest == StatusReqest.loading)
          {
            return const Center(child: Text("Loading"));
          }else if ( controller.statusReqest == StatusReqest.offlinefailure){
           return const Center(child: Text("Off Line failure "));
        }else if ( controller.statusReqest == StatusReqest.serverfailure){
          return const Center(child: Text("server failure"));
        } else{
          return ListView.builder(
            itemCount:controller.data.length ,
              itemBuilder: (context, index)
              {
                return Text("${controller.data}") ;
              }

          );
        }
        
      }),
    );
  }
}
