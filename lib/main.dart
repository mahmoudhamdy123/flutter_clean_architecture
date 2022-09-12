import 'package:clean_architecture/core/global/theme/theme_data/theme_data_light.dart';
import 'package:clean_architecture/core/services/services_locator.dart';
import 'package:clean_architecture/core/utils/app_string.dart';
import 'package:clean_architecture/feature/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: getThemeDataLight(),
      home:const MainMoviesScreen(),
    );
  }
}


