import 'package:flutter/material.dart';

class MyTheme {
  static const Color blue = Color(0xffABD7EB);
  static const Color cyan = Color(0xff92E5EF);
  static const Color purple = Color(0xffE6DBFE);
  static const Color grey = Color(0xffE1E3E8);
  static const Color darkBlue = Color(0xff688393);
  static const Color textSecondary = Color(0xff848A9C);
  static const Color secondarySurface = Color(0xfff2f6fd);

  static const LinearGradient blueGradient = LinearGradient(
    colors: [blue, Color(0x00ffffff)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cyanGradient = LinearGradient(
    colors: [cyan, Color(0x00ffffff)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
