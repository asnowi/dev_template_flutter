import 'package:dev_template_flutter/common/values/values.dart';
import 'package:flutter/material.dart';

class AppThemes {

  /**
   * SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
   */
  /// 亮色
  static ThemeData light = ThemeData(
    // colorScheme: const ColorScheme.light(
    // redAccent
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black87,size: 22.0,),
        backgroundColor: Colors.white,
        titleTextStyle: AppStyles.titleStyleLight,
      ),
    navigationBarTheme: const NavigationBarThemeData(backgroundColor: Colors.white),
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
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.5,
      iconTheme: const IconThemeData(color: Colors.white,size: 22.0,),
      backgroundColor: Colors.black54,
      titleTextStyle: AppStyles.titleStyleDark,
    ),
    navigationBarTheme: const NavigationBarThemeData(backgroundColor: Colors.black54),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.black54,
    ),
  );

}