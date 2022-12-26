import 'package:chat_app_ui_whatsapp_clone/colors.dart';
import 'package:chat_app_ui_whatsapp_clone/responsive/responsive_layout.dart';
import 'package:chat_app_ui_whatsapp_clone/screens/mobile_screen_layout.dart';
import 'package:chat_app_ui_whatsapp_clone/screens/web_screen_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
