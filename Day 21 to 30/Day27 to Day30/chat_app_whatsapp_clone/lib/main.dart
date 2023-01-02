import 'package:chat_app_whatsapp_clone/colors.dart';
import 'package:chat_app_whatsapp_clone/features/landing/screens/landing_screen.dart';
import 'package:chat_app_whatsapp_clone/firebase_options.dart';
import 'package:chat_app_whatsapp_clone/responsive/responsive_layout.dart';
import 'package:chat_app_whatsapp_clone/router.dart';
import 'package:chat_app_whatsapp_clone/screens/mobile_screen_layout.dart';
import 'package:chat_app_whatsapp_clone/screens/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(color: appBarColor)),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const LandingScreen()
        // const ResponsiveLayout(
        //     mobileScreenLayout: MobileScreenLayout(),
        //     webScreenLayout: WebScreenLayout()),
        );
  }
}
