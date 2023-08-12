
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:weam/class/handlingdataview.dart';
import 'package:weam/constant.dart';
import 'package:weam/models/productmodel.dart';
import 'package:weam/widget/productdetails/priceandcount.dart';
import 'package:weam/widget/productdetails/subproductlist.dart';
import 'package:weam/widget/productdetails/toppageproductdetails.dart';

import '../../../routes.dart';
import 'product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp()) ;
    return Scaffold(
      bottomNavigationBar: Container(
        margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 50,
        child: MaterialButton(
          onPressed: (){
            controller.goToCart();
          },
          child:Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Row(children: const[
              Text('Go to cart', style: TextStyle(fontWeight: FontWeight.bold, color: whiteBackColor),),
              Icon(Icons.add_shopping_cart_outlined, color: whiteBackColor),
            ],),
          ),

          color: secondBackColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      body:GetBuilder<ProductDetailsControllerImp>(builder: (controller)=> HandlingDataView(
        statusRequest: controller.statusReqest,
          widget: Container(
            child:ListView(
              children:
              [
                const TopPageProductDetails(),
                const SizedBox(
                  height: 120,
                ),

                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "${controller.itemsModel.name}",
                          style:Theme.of(context).textTheme.headline3!.copyWith(color: firstBackColor),
                        ),
                      ),
                      const SizedBox(height: 20,),

                      PriceAndCount(
                        onAdd: (){
                         // controller.countitems++ ;
                          controller.Add();
                        },
                        onRemove: (){
                          controller.Delete();
                         // controller.countitems-- ;
                        },
                        count: "${controller.countitems}",
                        price: "${controller.itemsModel.price}",),
                      const SizedBox(height: 20,),
                      Text(
                        "About Product:",
                        style:Theme.of(context).textTheme.headline6!.copyWith(color: firstBackColor),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        "${controller.itemsModel.description}""${controller.itemsModel.description}""${controller.itemsModel.description}""${controller.itemsModel.description}""${controller.itemsModel.description}",
                        style:Theme.of(context).textTheme.bodyText2!.copyWith(color: firstBackColor),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        "Details :",
                        style:Theme.of(context).textTheme.headline6!.copyWith(color: firstBackColor),
                      ),
                      const SizedBox(width: 10,),
                      GetBuilder<ProductDetailsControllerImp>(
                          builder: (controller) => HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: Column(
                                children: [
                                  Row(
                                    children: [
                                      ...List.generate(controller.attribute.length, (index) => Column(
                                        children:[
                                          //const Icon(Icons.color_lens_outlined,),
                                          IconButton(
                                            onPressed: (){
                                              controller.colorString = controller.attribute[index]['color'];
                                              //controller.color = Color(int.parse(controller.colorString));
                                              print("7777777777777777888888888888888888"+"${controller.colorString}");
                                            //  var myServices;
                                              print(token);
                                             // myServices.sharedPreferances.getString("token")!;
                                            },
                                            icon:  Icon(
                                              Icons.color_lens,
                                              color:Color(int.parse(controller.attribute[index]['color'])) ,
                                              size: 30, ),),

                                          const SizedBox(width: 20,),
                                          Container(
                                            child: Text(
                                              "${controller.attribute[index]["quaintity"]}",
                                              style:const TextStyle(color:firstBackColor ), ),
                                            padding:const EdgeInsets.only(left: 15),
                                          ),
                                        ],
                                      ),),
                                    ],
                                  ),

                                ],
                              )

                              ),
                            ),
                      //  SubProduct(),
                    ],

                  ),
                ),
              ],
            ),
          ),),)

            );
  }
}


