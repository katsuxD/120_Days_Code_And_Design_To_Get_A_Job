// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:level2_weather_app_api/src/screens/home_binding.dart';
import 'package:level2_weather_app_api/src/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () =>  HomeScreen(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
