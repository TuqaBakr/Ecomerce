import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/modules/shop_app/items/items_controller.dart';
import 'package:weam/routes.dart';

import '../../constant.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel ;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return InkWell(
            onTap: (){
              controller.goToBrodactDetails(itemsModel.id!, itemsModel) ;
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.id!}",
                      child: CachedNetworkImage(
                        imageUrl: AppLink.imageStatic + itemsModel.image!,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //Image.asset('assets/images/onboarding1.jpg'),
                     Text(
                      itemsModel.name!,
                      style: const TextStyle(
                          color: firstBackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                     Text(
                      "${itemsModel.description}",
                      textAlign: TextAlign.center,
                      style:const TextStyle(color: secondBackColor, fontSize: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                           children: [
                             Text(
                               "Rating:${itemsModel.rating!.toString()}",
                              style: const TextStyle(
                                  color: thirdBackColor,
                                  fontSize:10,
                                  fontWeight: FontWeight.bold
                              ),),
                             const Icon(Icons.star_outlined, size: 20,color:forthBackColor ,),
                           ],
                         ),
                        IconButton(
                            onPressed:(){},
                            icon: const Icon(Icons.favorite_border_outlined, color: secondBackColor,)
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

          );
        }
  }

