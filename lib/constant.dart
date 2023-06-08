import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

const Color whiteBackColor = Color(0xFFF1F2F6);
const Color firstBackColor = Color(0xFF27187E);
const Color secondBackColor = Color(0xff758BFD);
const Color thirdBackColor = Color(0xffd2d7f8);
const Color forthBackColor = Color(0xffFF8600);


const Color black = Color(0xff000000);
const Color white = Color(0xffffffff);

const BoxDecoration gradiantBackgroind = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          whiteBackColor,
          firstBackColor,
        ])
);
