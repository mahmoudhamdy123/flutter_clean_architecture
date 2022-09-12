
import 'package:clean_architecture/core/global/theme/app_color/app_colors_light.dart';
import 'package:flutter/material.dart';

ThemeData getThemeDataLight()=>ThemeData(
    backgroundColor: AppColorsLight.appBarCor,
    appBarTheme: const AppBarTheme(
        color: Colors.deepPurple
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.lightGreen)
        ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.red
    ),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Colors.amberAccent
        )
    )
);