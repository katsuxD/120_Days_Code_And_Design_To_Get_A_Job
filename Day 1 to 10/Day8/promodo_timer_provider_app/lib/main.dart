import 'package:flutter/material.dart';
import 'package:promodo_timer_provider_app/screens/promodo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PromodoScreen(),
    );
  }
}

