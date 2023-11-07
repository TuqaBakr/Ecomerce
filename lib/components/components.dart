import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weam/constant.dart';

class FormFeild extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid ;
  final bool  isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const FormFeild({
    Key? key,
        required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.hinttext,
    required this.valid,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText==null || obscureText==false ? false : true,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
        autovalidateMode: AutovalidateMode.always,
        validator: valid ,
        controller: mycontroller,
        decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.width/30),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/100,horizontal:MediaQuery.of(context).size.width/15),
        label: Text(labeltext),
        suffixIcon: InkWell(child: Icon(iconData),onTap:onTapIcon ,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:const BorderSide(
              color: secondBackColor,
              width: 2,

            )
          )
      ),
    );
  }
}



/////////////////////////////////////////////////////////////////////////////////

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;

  const DefaultButton({Key? key,
    required this.text,
    this.onPressed,
    required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed ,
        child: Text(text, style: TextStyle(fontSize: MediaQuery.of(context).size.height/50),),
        color: color,
        textColor: white,
      ),
    );
  }
}

