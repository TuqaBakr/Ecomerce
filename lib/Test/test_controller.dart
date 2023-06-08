import 'package:get/get.dart';
import 'package:weam/Test/test.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/handingdatacontroller.dart';

class TestController extends GetxController{
  TestData testData = TestData(Get.find()) ;

  List data = [] ;

  late StatusReqest statusReqest ;

  getData()async{
    statusReqest = StatusReqest.loading;
    var response = await testData.getData() ;
    statusReqest = handlingData(response) ;
    if(StatusReqest.successs == statusReqest){
      data.addAll(response['data']) ;
    }
    update() ;
  }

  @override
  void onInit() {
    getData() ;
    super.onInit();
  }
}