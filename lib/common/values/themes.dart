import 'package:dev_template_flutter/common/values/values.dart';
import 'package:flutter/material.dart';

class AppThemes {

  /// 亮色
  static ThemeData light = ThemeData(
    // colorScheme: const ColorScheme.light(
    // redAccent
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        titleTextStyle: AppStyles.titleStyle,
      ),
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.white60,
        ),
  );


  /// 暗色
  static ThemeData dark = ThemeData(
    // colorScheme: const ColorScheme.dark(
    // ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.5,
      backgroundColor: Colors.black,
      titleTextStyle: AppStyles.titleStyle,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.black87,
    ),
  );

}