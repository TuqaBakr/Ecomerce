
import 'package:flutter/material.dart';
import 'package:weam/components/components.dart';
import 'package:weam/function/validinput.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar ;
  final void Function()? onPressedIcon ;
  final void Function()? onPressedIconSearch ;

  const CustomAppBar({Key? key, required this.titleappbar, this.onPressedIcon, this.onPressedIconSearch}) : super(key: key);

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
              onTap: onPressedIconSearch,
              validator: (val) {
                return validInput(val!, 8, 20, "Search");
              },
              decoration: InputDecoration(
                labelText: "",
                hintText: titleappbar,
                prefixIcon: const Icon(Icons.search_outlined),
                border: InputBorder.none,
              ),
              controller: controller, // Use the initialized controller here
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
              onPressed: onPressedIcon,
              icon: const Icon(Icons.notifications_active_outlined),
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}
