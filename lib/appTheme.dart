import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color normalColor = Color(0xFF191481);
  static const Color focusTabColor = Color(0xFF5D50FE);
  static const Color buttonBg = Color(0xFFF6F6FE);

  static const TextStyle normalTab =
      TextStyle(fontSize: 18, color: normalColor, fontWeight: FontWeight.bold);

  static const TextStyle focusTab = TextStyle(
      fontSize: 18, color: focusTabColor, fontWeight: FontWeight.bold);
}
