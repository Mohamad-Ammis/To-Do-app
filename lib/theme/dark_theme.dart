import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(color: Constans.kDarkBackgroundColor),
    colorScheme: const ColorScheme.dark(
        surface: Constans.kDarkBackgroundColor,
        primary: Constans.kCardBackgroundColor,
        secondary: Constans.kWhiteElementColor));
