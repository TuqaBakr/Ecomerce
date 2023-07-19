
import 'package:flutter/material.dart';
import 'package:weam/widget/home/customappbar.dart';
import 'package:weam/widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            CustomAppBar(
                titleappbar: "Find Product", onPressedIcon: (){}, onPressedIconSearch: (){}),
            const SizedBox(height: 20,) ,
            const ListCategoriesItems() ,
          ],

        ),
      ),
    );
  }
}
