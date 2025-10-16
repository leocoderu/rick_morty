import 'dart:ui';

import 'default_theme.dart';

class DarkTheme implements DefaultTheme {
  int id = 2;
  String? name = 'Dark Theme';

  Color? whiteColor = Color(0xFFFFFFFF);
  Color? blackColor = Color(0xFF000000);
  Color? shadowColor = Color(0x30000000);

  Color? mainColor100 = Color(0xFFEBDCA3);
  Color? mainColor200 = Color(0xFFE5D085);
  Color? mainColor300 = Color(0xFFDEC466);
  Color? mainColor400 = Color(0xFFB29D52);
  Color? mainColor500 = Color(0xFF85763D);

  Color? blackColor100 = Color(0xFF201D26);
  Color? blackColor200 = Color(0xFF58565C);
  Color? blackColor300 = Color(0xFF908E93);
  Color? blackColor400 = Color(0xFFC7C7C9);
  Color? blackColor500 = Color(0xFFF4F4F4);


  Color? redColor100 = Color(0xFF791711);
  Color? redColor200 = Color(0xFFA11F17);
  Color? redColor300 = Color(0xFFCA271D);
  Color? redColor400 = Color(0xFFD5524A);
  Color? redColor500 = Color(0xFFDF7D77);
}