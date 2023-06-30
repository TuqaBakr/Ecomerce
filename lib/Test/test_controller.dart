import 'package:get/get.dart';
import 'package:weam/Test/test.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';


class TestController extends GetxController{
  TestData testData = TestData(Get.find()) ;

  List data = [] ;
  List categories= [] ;

  late StatusReqest statusReqest ;

  getData()async{
    statusReqest = StatusReqest.loading;
    var response = await testData.getData() ;
    statusReqest = handlingData(response) ;
    if(StatusReqest.successs == statusReqest){
      if(response['status'] == statusReqest){
        data.addAll(response['categories']) ;
      }
      else {
        statusReqest = StatusReqest.failure;
      }
    }
    update();
   }

  @override
  void onInit() {
    getData() ;
    super.onInit();
  }
}