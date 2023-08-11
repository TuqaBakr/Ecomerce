import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weam/models/itemmodel.dart';

import '../../../constant.dart';
import '../../../routes.dart';

class CustomCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child:Row( children: [
        Expanded(
            flex:2,
            child: CachedNetworkImage(
              imageUrl: image,
            )),
        Expanded(
            flex:3,
            child:ListTile(
              title:Text(name, style: TextStyle(color: firstBackColor,fontSize: 15),),
              subtitle: Text(price, style: TextStyle(color: forthBackColor,fontSize: 17),),
            )),
        Expanded(
            child:Column(children: [
              IconButton(onPressed: onAdd , icon: Icon(Icons.add)),
              Container(child: Text(count, style: TextStyle(fontFamily:"sans" ),)),
              IconButton(onPressed: onRemove , icon: Icon(Icons.remove)),
            ],)),
      ],)
      ),
    );
  }
}
