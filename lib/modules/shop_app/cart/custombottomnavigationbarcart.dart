import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'bouttomcart.dart';

class CustomBottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice ;
  const CustomBottomNavigationBarCart({Key? key, required this.price, required this.shipping, required this.totalprice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Price" , style: TextStyle(fontSize: 18),)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price\$",style: TextStyle(fontSize: 18),)),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Shipping" , style: TextStyle(fontSize: 18),)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping\$",style: TextStyle(fontSize: 18),)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(color: firstBackColor,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total Price" , style: TextStyle(color:OrangeColor ,fontWeight: FontWeight.bold ,fontSize: 18),)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice\$",style: TextStyle( color:OrangeColor,fontWeight: FontWeight.bold, fontSize: 18),)),
          ],
        ),
        SizedBox(height: 15,),
        ButtomCart(
          text: 'Place Order',
          color: forthBackColor,
          onPressed: (){},

        )
      ],
    ),);
  }
}
