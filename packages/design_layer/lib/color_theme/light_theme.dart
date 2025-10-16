import 'dart:ui';

import 'default_theme.dart';

class LightTheme implements DefaultTheme{
  int id = 1;
  String? name = 'Light Theme';

  Color? whiteColor = Color(0xFFFFFFFF);
  Color? blackColor = Color(0xFF000000);
  Color? shadowColor = Color(0x30000000);

  Color? mainColor100 = Color(0xFFA3B3EB);
  Color? mainColor200 = Color(0xFF859AE5);
  Color? mainColor300 = Color(0xFF6680DE);
  Color? mainColor400 = Color(0xFF5267B2);
  Color? mainColor500 = Color(0xFF3D4D85);

  Color? blackColor100 = Color(0xFFF4F4F4);
  Color? blackColor200 = Color(0xFFC7C7C9);
  Color? blackColor300 = Color(0xFF908E93);
  Color? blackColor400 = Color(0xFF58565C);
  Color? blackColor500 = Color(0xFF201D26);

  Color? redColor100 = Color(0xFFDF7D77);
  Color? redColor200 = Color(0xFFD5524A);
  Color? redColor300 = Color(0xFFCA271D);
  Color? redColor400 = Color(0xFFA11F17);
  Color? redColor500 = Color(0xFF791711);
}