import 'package:flutter/material.dart';

import '../../../constant.dart';

class CardPaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive ;
  const CardPaymentMethod({Key? key,
    required this.title,
    required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10,),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color:isActive == true ? forthBackColor: secondBackColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child:  Text(title,
          style: TextStyle(
            fontSize: 18,
            color:isActive==true ? whiteBackColor:whiteBackColor,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
      ),
    );
  }
}
