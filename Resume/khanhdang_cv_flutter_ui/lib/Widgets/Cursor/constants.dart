import 'package:flutter/material.dart';

class CursorConstants {
  static BoxDecoration boxDecorationOne = BoxDecoration(
      border: Border.all(color: Colors.red, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(90),
      ),
      color: Colors.transparent);

  static BoxDecoration boxDecorationTwo = BoxDecoration(
      border: Border.all(color: Colors.red, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(90),
      ),
      color: Colors.red);

  static BoxDecoration boxDecorationHovered = BoxDecoration(
      border: Border.all(color: Colors.red, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(90),
      ),
      color: Colors.red.withOpacity(0.3));
}
