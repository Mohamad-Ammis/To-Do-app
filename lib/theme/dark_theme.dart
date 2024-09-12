import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: Constans.kDarkBackgroundColor),
    colorScheme: ColorScheme.dark(
        background: Constans.kDarkBackgroundColor,
        primary: Constans.kCardBackgroundColor,
        secondary: Constans.kWhiteElementColor));
