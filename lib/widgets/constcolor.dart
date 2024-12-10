import 'package:flutter/material.dart';

class CustomColor{

  static Color background_color = const Color(0xFF010C17);
  static Color icon_color = Color(0xFFE0E4E7);
  static Color background_field = const Color(0xFF131818);
  static Color field_text_color = const Color(0xFFFFFFFF);
  static Color text_color = const Color(0xFF000000);


  static double heigth(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

}