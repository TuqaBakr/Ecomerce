
import 'package:flutter/material.dart';

import '../../../constant.dart';

class ButtomCart extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;

  const ButtomCart({Key? key,
    required this.text,
    this.onPressed,
    required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal:30 ),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed ,
        child: Text(text),
        color: color,
        textColor: white,
      ),
    );
  }
}