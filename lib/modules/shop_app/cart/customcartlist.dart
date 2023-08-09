import 'package:flutter/material.dart';
import 'package:weam/models/itemmodel.dart';

import '../../../constant.dart';

class CustomCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  const CustomCartList({Key? key,required this.name,required this.price,required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child:Row( children: [
        Expanded(
            flex:2,
            child:  Image.asset('assets/images/logo.jpg')),
        Expanded(
            flex:3,
            child:ListTile(
              title:Text(name,style: TextStyle(color: firstBackColor,fontSize: 15),),
              subtitle: Text(price,style: TextStyle(color: forthBackColor,fontSize: 17),),
            )),
        Expanded(
            child:Column(children: [
              IconButton(onPressed: (){} , icon: Icon(Icons.add)),
              Container(child: Text(count, style: TextStyle(fontFamily:"sans" ),)),
              IconButton(onPressed: (){} , icon: Icon(Icons.remove)),
            ],)),
      ],)
      ),
    );
  }
}
