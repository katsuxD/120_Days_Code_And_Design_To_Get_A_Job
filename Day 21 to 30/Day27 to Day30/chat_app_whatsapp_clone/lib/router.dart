import 'package:chat_app_whatsapp_clone/common/widgets/error.dart';
import 'package:chat_app_whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:chat_app_whatsapp_clone/features/auth/screens/otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => OTPScreen(verificationId: verificationId),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: "This page doesn't exist"),
        ),
      );
  }
}
