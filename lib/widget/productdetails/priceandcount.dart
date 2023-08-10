
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class PriceAndCount extends StatelessWidget {
  const PriceAndCount({Key? key,required this.onAdd,required this.onRemove,required this.price,required this.count}) : super(key: key);
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price ;
  final String count ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Row(
          children: [
            IconButton(onPressed:onAdd, icon: const Icon(Icons.add)),
            Container(
                padding:const EdgeInsets.only(left: 8, top: 4),
                height: 37,
                width: 47,
                decoration: const BoxDecoration(color: thirdBackColor),
                child:Text(
                  "$count",
                  style:const TextStyle(
                      color: fifthBackColor,
                      fontSize: 20
                  ),)),

            IconButton(onPressed:onRemove, icon:const Icon(Icons.remove))
          ],
        ),
        const Spacer(),
        Text("$price\$", style: const TextStyle(color:forthBackColor, fontWeight: FontWeight.bold, fontSize: 20 ),),
      ],
    );
  }
}
