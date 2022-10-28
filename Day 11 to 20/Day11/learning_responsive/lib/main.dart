import 'package:flutter/material.dart';
import 'package:learning_responsive/responsive/desktop_scaffold.dart';
import 'package:learning_responsive/responsive/mobile_scaffold.dart';
import 'package:learning_responsive/responsive/responsive_layout.dart';
import 'package:learning_responsive/responsive/tablet_scaffold.dart';

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
      home: ResponsiveLayout(
        mobileScaffold: MobileScafold(),
        tabletScaffold: TabletScaffold(),
        desktopcaffold: DesktopScaffold(),
      ),
    );
  }
}
