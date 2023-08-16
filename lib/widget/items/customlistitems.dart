import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:weam/models/itemmodel.dart';
import 'package:weam/modules/shop_app/items/favorite_controller.dart';
import 'package:weam/modules/shop_app/items/items_controller.dart';
import 'package:weam/routes.dart';

import '../../constant.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel ;
  final bool active;
  const CustomListItems({Key? key, required this.itemsModel,required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
  //  FavoriteController favcontroller = Get.put(FavoriteController());
    return InkWell(
            onTap: (){
              controller.goToBrodactDetails(itemsModel.id!, itemsModel) ;
            },
            child: Card(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                "${itemsModel.price}" + "\$",
                                //  textAlign: TextAlign.left,
                                style:const TextStyle(color: forthBackColor, fontSize: 14),
                              ),
                            ),
                            GetBuilder<FavoriteController>(builder: (controller) => IconButton(
                                onPressed:(){
                                  if(controller.isfavorite[itemsModel.id] == true) {
                                    //controller.isfavorite[itemsModel.id] = false ;
                                    controller.setFavorite(itemsModel.id, false) ;
                                  } else if(controller.isfavorite[itemsModel.id] == false) {
                                   // controller.isfavorite[itemsModel.id] = true ;
                                    controller.setFavorite(itemsModel.id, true) ;
                                  }
                                  print(controller.isfavorite[itemsModel.id]) ;
                                  // controller.isfavorite[itemsModel.id] = true ? controller.setFavorite(itemsModel.id, false) :controller.setFavorite(itemsModel.id, true) ;
                                },
                                icon: Icon(
                                  controller.isfavorite[itemsModel.id] ? Icons.favorite_outlined : Icons.favorite_border_rounded,
                                  //size: iconSize,
                                  color: forthBackColor,

                                //Icon(controller.isfavorite[itemsModel.id] == true ? Icons.favorite_outlined : Icons.favorite_border_rounded,
                            ), ))
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Rating:      ",
                              style: TextStyle(
                                  color: sevenBackColor,
                                  fontSize:10,
                                  fontWeight: FontWeight.bold
                              ),),
                            Center(
                              child: StarRating(
                                  starCount: 5, // Specify the total number of stars
                                  rating: itemsModel.rating!, // Specify the rating value
                                  iconSize: 15, // Customize the size of the stars
                                  color: sevenBackColor // Customize the color of the stars
                              ),
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),
                  if( itemsModel.discount.toString() != "0")Positioned(
                      left: 1,
                      top: 1,
                      child: Image.asset(
                        "assets/images/sallle.png", width: 45,))

                ],
              ),
            ),

          );
        }
  }

class StarRating extends StatelessWidget {
  final int starCount;
  final int rating;
  final double iconSize;
  final Color color;

  StarRating({
    required this.starCount,
    required this.rating,
    this.iconSize = 24.0,
    this.color = sevenBackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          size: iconSize,
          color: color,
        );
      }),
    );
  }
}