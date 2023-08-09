import 'package:flutter/material.dart';
import 'package:weam/components/components.dart';

import '../../../constant.dart';
import 'bouttomcart.dart';
import 'custombottomnavigationbarcart.dart';
import 'customcartlist.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBarCart(
        totalprice: '1200',
        price: '1000',
        shipping: '200',),

      body: ListView(
        children: [
          Container(
             color: whiteBackColor,
             alignment: Alignment.center,
            child:Row(
                children: [
                Expanded(child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {  },
                    icon: Icon(Icons.arrow_back),
                  ),
                )),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "My Cart",
                    style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold
                    ),),
                )),
                Spacer(),
              ],),),
          Container(
            color: whiteBackColor,
            padding: EdgeInsets.all(8),
            child: Column(children: [
              CustomCartList(
                name: "Macbook",
                price: "1200\$",
                count: "3",
              )

            ],),
          ),

        ],
      ),
    );
  }
}
