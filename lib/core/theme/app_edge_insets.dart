import 'package:flutter/cupertino.dart';

class AppEdgeInsets {
// Base scale - change this one value to adjust the whole app
  static const double _base = 4.0;

  static const EdgeInsets xs = EdgeInsets.all(_base);          // 4.0
  static const EdgeInsets s  = EdgeInsets.all(_base * 2);      // 8.0
  static const EdgeInsets m  = EdgeInsets.all(_base * 4);      // 16.0
  static const EdgeInsets l  = EdgeInsets.all(_base * 6);      // 24.0
  static const EdgeInsets xl = EdgeInsets.all(_base * 8);      // 32.0
  static const EdgeInsets xxl = EdgeInsets.all(_base * 10);    // 40.0

  // Horizontal only
  static const EdgeInsets hM = EdgeInsets.symmetric(horizontal: _base * 4);
  // Vertical only
  static const EdgeInsets vM = EdgeInsets.symmetric(vertical: _base * 4);
}