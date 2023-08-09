
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/modules/shop_app/home_page/home_page_controller.dart';
import 'package:weam/routes.dart';
import 'package:weam/widget/home/customappbar.dart';
import 'package:weam/widget/home/listHratingitems.dart';
import 'package:weam/widget/home/listcategorieshome.dart';
import 'package:weam/widget/home/listdiscountitemshome.dart';

import '../../../constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp()) ;
    return GetBuilder<HomeControllerImp>(
        builder: (controller) =>Container(
            padding: const EdgeInsets.all(15.0),
            child:ListView(
              children: [
                CustomAppBar(
                  titleappbar: "Find Product",
                  //onPressedIcon: (){},
                  onPressedIconSearch: (){
                    controller.onSearchItems();
                  },
                  mycontroller: controller.Search!,
                  onChanged: (val){
                    controller.checkSearch(val) ;
                  },
                ),

          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: !controller.isSearch
                ? Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                const SizedBox(height: 10,),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child:  ListTile(
                        title: Text("A summer surprice",
                            style: TextStyle(color: fifthBackColor.withOpacity(0.7), fontSize:25, fontFamily: 'DeliciousHandrawn',)
                        ),
                        subtitle: Text(
                            "Cast back 20%",
                            style: TextStyle(
                              color: fifthBackColor.withOpacity(0.5),
                              fontSize:20,
                              fontFamily: 'DeliciousHandrawn',)),
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                        color: secondBackColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      right: controller.lang == "en" ?  -50 : null,
                      left: controller.lang == "ar" ?  -50 : null,
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: sevenBackColor,
                          borderRadius:BorderRadius.circular(160),
                        ),

                      ),
                    ),
                  ],
                ),
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    "Categories:",
                    style: TextStyle(
                      color: firstBackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold ,
                    ),
                  ),
                ),
                const ListCategoriesHome() ,
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "Discount Products:",
                    style: TextStyle(
                      color: firstBackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ListDiscountItemsHome(),
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "High Rating Product:",
                    style: TextStyle(
                      color: firstBackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ListHighRatingItemsHome(),
              ],
            )
                : ListItemsSearch(listdataModel: controller.listdata)
          ),

              ],
            ),
          ),

      );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdataModel ;
  const ListItemsSearch({Key? key,required this.listdataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdataModel.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              controller.goToProductDetails(listdataModel[index].id!, listdataModel[index]) ;
            },
            child: Container(
              margin:const  EdgeInsets.symmetric(vertical: 10),
              child: Card(
                child: Container(
                  padding:const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                            imageUrl: AppLink.imageStatic + "${listdataModel[index].image}",
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          )
                      ),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdataModel[index].name!),
                            subtitle: Text(listdataModel[index].description!),
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
    });
  }
}

