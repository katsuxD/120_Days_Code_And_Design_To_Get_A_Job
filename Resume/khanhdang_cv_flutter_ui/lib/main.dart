import 'dart:js';

import 'package:flutter/material.dart';
import 'package:khanhdang_cv_flutter_ui/Provider/tab_data_provider.dart';
import 'package:khanhdang_cv_flutter_ui/Views/homepage.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Cursor/animated-circle_cursor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TabDataProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Resume',
      home: AnimatedCursorWrapper(
        child: Homepage(),
      ),
    );
  }
}
