import 'package:get/get.dart';
import 'package:weam/Test/test.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';


class TestController extends GetxController{
  TestData testData = TestData(Get.find()) ;

  List data = [] ;
  //List categories= [] ;

  late StatusReqest statusRequest ;

  getData()async{
    statusRequest = StatusReqest.loading;
    var response = await testData.getData() ;
    print("rererere========================== $response");

    statusRequest = handlingData(response) ;
     if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        data.addAll(response['Catigoryes']) ;
        print(response);
        print("${data}=-=-=--=-==") ;
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }
     print("${statusRequest}ffffffffffffff") ;
    update();
   }


  @override
  void onInit() {
    getData() ;
    super.onInit();
  }
}