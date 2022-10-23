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
        iconTheme: const IconThemeData(color: Colors.black87,size: 22.0,),
        backgroundColor: Colors.white,
        titleTextStyle: AppStyles.titleStyleLight,
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
      iconTheme: const IconThemeData(color: Colors.white,size: 22.0,),
      backgroundColor: Colors.black,
      titleTextStyle: AppStyles.titleStyleDark,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.black87,
    ),
  );

}