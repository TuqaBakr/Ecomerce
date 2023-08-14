import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../routes.dart';

class CardDeliveryType extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;

  const CardDeliveryType({Key? key,
    required this.imagename,
    required this.title,
    required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color:active == true ? forthBackColor:null,
        border:Border.all(color: firstBackColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename ,
            width: 100,
            color:active == true ? whiteBackColor : null,
          ),
          const SizedBox(height: 3,),
          Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: firstBackColor),),
        ],
      ),
    );
  }
}
