
import 'package:clean_architecture/core/global/theme/app_color/app_colors_light.dart';
import 'package:flutter/material.dart';

ThemeData getThemeDataDark()=>ThemeData(
    backgroundColor: AppColorsLight.appBarCor,
    appBarTheme: const AppBarTheme(
        color: Colors.deepPurple
    )
);