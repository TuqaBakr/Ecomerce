
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';
import 'package:weam/routes.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar ;
  final void Function()? onPressedIcon ;
  final void Function()? onPressedIconSearch ;
  final void Function(String)? onChanged ;
  final TextEditingController mycontroller ;

  const CustomAppBar({Key? key, required this.titleappbar, this.onPressedIcon, this.onPressedIconSearch, this.onChanged, required this.mycontroller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      //padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(child:
          Container(
            height: 50,
            padding: const EdgeInsets.all(3.0),
            decoration:  BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(
             Radius.circular(17.0),
        ),
      ),
            child: TextFormField(
              onChanged: onChanged,
              //onTap: onPressedIcon,
              validator: (val) {
                return validInput(val!, 8, 20, "Search");
              },
              decoration: InputDecoration(
                labelText: "",
                hintText: titleappbar,
                prefixIcon: IconButton(
                  icon: Icon(Icons.search_outlined),
                  onPressed:onPressedIconSearch ,


                ),
                border: InputBorder.none,
              ),
              controller: mycontroller, // Use the initialized controller here
            ),
    ),
    ),
          const SizedBox(width: 10,),
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(17.0),),
            ),
            child: IconButton(
              onPressed: (){
                Get.toNamed(AppRoute.favorite);
              },
              icon: const Icon(Icons.favorite_outline_outlined),
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}
