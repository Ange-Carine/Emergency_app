import 'package:authentication/config/themes/text_theme.dart';
import 'package:flutter/material.dart';


class SOSTheme{

  static ThemeData lightTheme =  ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xffD31919),
    textTheme: STextTheme.lightTextTheme,
  );

  static ThemeData darkTheme =  ThemeData(
    brightness: Brightness.dark
  );
}