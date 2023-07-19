
import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed ;
  final String textbutton ;
  final IconData iconData ;
  final bool? active;
  const CustomButtonAppBar({Key? key, this.onPressed, required this.textbutton, required this.iconData,  required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Icon(iconData, color: active == true ? forthBackColor :firstBackColor),
            Text(textbutton, style: TextStyle(color: active == true ? forthBackColor : firstBackColor )),
          ],),
      );
  }
}
