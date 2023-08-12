import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/function/handingdatacontroller.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/modules/shop_app/items/items_date.dart';

import '../../../routes.dart';

abstract class ItemsController extends GetxController{
  intialData();
  getData();
  changeSubCat( int val, int idSub);
  getItems();
  goToBrodactDetails(int productID, ItemsModel itemsModel);

}

class ItemsControllerImp extends ItemsController{

  List categories  = [] ;
  List subcategories  = [] ;
  //List data  = [] ;
  List products = [] ;
  int selectedCat = Get.arguments["selectedCat"] + 1  ;
  int selectedSub = 0;
  late int? subId ;
  late TextEditingController search;
  TextEditingController? Search ;
  bool isSearch = false ;
  List<ItemsModel> listdata = [];

  ItemData itemData = ItemData(Get.find()) ;

  late StatusReqest statusRequest ;
  late StatusReqest statusRequestItems ;


  checkSearch(val){
    if(val == ""){
      isSearch = false;
    }
    update();
  }


  onSearchItems(){
    isSearch = true ;
    searchData() ;
    update();
  }


  @override
  intialData() {
    categories  = Get.arguments["categories"] ;
    print(selectedCat);

  }
  @override
  void onInit() {
    Search = TextEditingController() ;
    getData();
    intialData() ;
    search = TextEditingController();
    getItems();
    super.onInit() ;
  }

  @override
  changeSubCat(val,  idSub) {
    selectedSub = val ;
    subId = idSub ;
    getItems();
    update() ;
  }

  @override
  getData() async {
    statusRequest = StatusReqest.loading;
    //var response = await itemData.getData(selectedCat) ;
    var response = await itemData.getData("${AppLink.subcategories}""${selectedCat}") ;
    print("rererere========================== $response");
    statusRequest = handlingData(response) ;
    if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        subcategories.addAll(response['Subcatigoryes']) ;
        print(response);
        print("22222222222222222222${subcategories}") ;
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }
    print("${statusRequest}ffffffffffffff") ;
   // getItems();
    update();
   // statusRequest = StatusReqest.loading ;
  }

  @override
  getItems() async{
    products.clear();
    statusRequestItems = StatusReqest.loading;
    var response = await itemData.getData("${AppLink.products}""${subId}");
    //print("rererere========================== $response");
    statusRequestItems = handlingData(response) ;
   // print(response['products']);
   // print(StatusReqest);
    if(StatusReqest.success == statusRequestItems){
      print(StatusReqest);
      print("===lllllllllllllllllllllllllllaaaaaaaaaaaaaaaaaaa$subId++$selectedSub");
      if(response['status'] == "success"){
        products.addAll(response['products']);
        //print(response['products']) ;
        print("55555555555555${products}55555555555555555" ) ;
       // print(response);
       // print(subcategories) ;
      }
      else {
        statusRequestItems = StatusReqest.failure;
      }
    }
    print("${statusRequest}ffffffffffffff") ;
    update();

  }

  searchData() async {
    statusRequest = StatusReqest.loading;
    var response = await itemData.searchData(Search!.text) ;
    statusRequest = handlingData(response) ;
    if(StatusReqest.success == statusRequest){
      if(response['status'] == "success"){
        listdata.clear();
        List responsedata = response['products'] ;
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      }
      else {
        statusRequest = StatusReqest.failure;
      }
    }
    print("${statusRequest}ffffffffffffff") ;
    update();
  }

  @override
  goToBrodactDetails(productID, itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {
      "ProductModel": itemsModel ,
      "ProductID"   : productID,
    });
    }
}