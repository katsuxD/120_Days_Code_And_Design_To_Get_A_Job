import 'package:flutter/material.dart';
import 'package:promodo_timer_provider_app/screens/promodo_screen.dart';
import 'package:promodo_timer_provider_app/services/timer_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TimerService>(
    create: (_) => TimerService(),
    child: MyApp(),
  ));
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
