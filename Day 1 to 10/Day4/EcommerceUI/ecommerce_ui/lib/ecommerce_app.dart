import 'package:ecommerce_ui/src/ui/ecommerce_main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EcommerceApp extends StatelessWidget {
  EcommerceApp({super.key});
  final _routes = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const EcommerceMainPage(),
    ),
  ], initialLocation: "/");

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routes,
    );
  }
}
