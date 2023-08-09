import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/models/productmodel.dart';
import 'package:weam/modules/shop_app/cart/cart_controller.dart';
import 'package:weam/modules/shop_app/product_details/product_details_data.dart';
import 'package:weam/routes.dart';

abstract class ProductDetailsController extends GetxController{
getData();

}
class ProductDetailsControllerImp extends ProductDetailsController{

 CartController cartController = Get.put(CartController());
  ProductData productData = ProductData(Get.find()) ;

  late ItemsModel itemsModel ;
  late int productId ;
  late StatusReqest statusRequest ;
  late List product  = [] ;
  late List attribute  = [] ;
 // late List color  = [] ;

  initialData(){
    productId  = Get.arguments['ProductID']  ;
    itemsModel = Get.arguments['ProductModel'] ;

  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    product.clear();
    attribute.clear();
     statusRequest = StatusReqest.loading;
    //var response = await itemData.getData(selectedCat) ;
    var response = await productData.getData("${AppLink.productsDetails}""${productId}") ;
    print("rererere========================== $response");
    statusRequest = handlingData(response) ;
    if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        product.addAll(response['product']) ;
        attribute.addAll(response['attribute']) ;
        print(response);
        print("22222222222222222222$product") ;
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }
    print("${statusRequest}ffffffffffffff") ;
    update();
  }

}