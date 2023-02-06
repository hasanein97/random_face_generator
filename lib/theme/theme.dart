import 'package:flutter/material.dart';
import '../constant/string.dart';

class CustomeTheme with ChangeNotifier{
  late bool isDark;
  CustomeTheme(this.isDark);
  Color get sourceColor =>(isDark)?kDarkSourceColor:kLightSourceColor;
  Color get shadowColor =>(isDark)?kDarkShadowColor:kLightShadowColor;
  List<BoxShadow> get boxShadow =>[
    BoxShadow(
      offset: Offset(-9,-9),
      blurRadius:8,
      color: sourceColor,
    ),
    BoxShadow(
      offset: Offset(9,9),
      blurRadius:8,
      color: shadowColor,
    ),
  ];
  BoxDecoration get boxDecoration =>BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: (isDark)?kDarkBackgroundColor:kLightBackgroundColor,
    boxShadow: boxShadow,
  );
  Border get border => Border(
    top: BorderSide(color: sourceColor,width: 4),
    left: BorderSide(color: sourceColor,width: 4),
    bottom: BorderSide(color: shadowColor,width: 4),
    right: BorderSide(color: shadowColor,width: 4),
  );

}