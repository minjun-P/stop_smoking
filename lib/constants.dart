import 'package:flutter/material.dart';

// ! 메인 컬러
const MaterialColor mWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
// ! 메인 그림자 값
const BoxShadow mShadow = BoxShadow(
    color: Colors.grey, spreadRadius: 0.2, blurRadius: 2, offset: Offset(1, 1));
// ! 메인 borderRadius
BorderRadius mBorderRadius = BorderRadius.circular(15);
