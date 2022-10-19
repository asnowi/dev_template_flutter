import 'package:flutter/material.dart';

class AppThemes {

  /// 亮色
  static ThemeData light = ThemeData(
    // colorScheme: const ColorScheme.light(
    // redAccent
      scaffoldBackgroundColor: Colors.grey.shade100,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.white60,
        ),
  );


  /// 暗色
  static ThemeData dark = ThemeData(
    // colorScheme: const ColorScheme.dark(
    // ),
    scaffoldBackgroundColor: Colors.black54,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.black87,
    ),
  );

}