import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/models/itemmodel.dart';

import '../../../constant.dart';
import '../../../routes.dart';

class CustomCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
//  final void Function()? onAdd;
//  final void Function()? onRemove;
  const CustomCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    //required this.onAdd,
  //  required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child:Row( children: [

        Expanded(
            flex:3,
            child:CachedNetworkImage(
              imageUrl: AppLink.imageStatic + image,
              height:  Get.width /3,
              width:  Get.width ,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            )
      ),

        Expanded(
            flex:3,
            child:Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Column(
                children :[
                Text(
                  name,
                  style:const TextStyle(
                      color: sevenBackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold

                  ),),
                const SizedBox(height: 6,),
                Text(price + "\$",
                    style:const TextStyle(
                        color: forthBackColor,
                        fontSize:13
                    ),),
                ]



              ),
            )),
        Expanded(
            child:Column(children: [
              const Icon(Icons.production_quantity_limits_rounded,color: secondBackColor,),
              const SizedBox(height: 5,),//  const Icon(Icons.production_quantity_limits_rounded),
              Text(count, style: const TextStyle(fontFamily:"sans", color: secondBackColor, fontWeight:FontWeight.bold),),
             // IconButton(onPressed: onRemove, icon:const Icon(Icons.remove)),
            ],)),
      ],)
      ),
    );
  }
}
