
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class UIUtils {

  static bool isEmpty(Object? o) {
    if(o == null) return true;
    return GetUtils.isBlank(o)?? true;
  }

  static bool isNotNull(Object? o) {
    if(o == null) return false;
    return true;
  }


  static Future<bool> openSettings() async {
    return openAppSettings();
  }


  static IconButton onAppBarBack({VoidCallback? onBack,Color? iconColor}) {
    return IconButton(
      onPressed: (){
        if(onBack != null) {
          onBack();
        }
      },
      splashRadius: AppDimens.backRadius,
      icon: Icon(
        Icons.arrow_back_ios,
        color: iconColor?? Colors.black87,
        size: 18,
      ),
    );
  }

  static IconButton onAppBarCircleBack({VoidCallback? onBack,Color? iconColor}) {
    return IconButton(
      onPressed: (){
        if(onBack != null) {
          onBack();
        }
      },
      splashRadius: AppDimens.backRadius,
      icon: Container(
        constraints: const BoxConstraints.expand(width: 34.0,height: 34.0),
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(17.0)),color: Colors.white24),
        child: Icon(
          Icons.arrow_back_ios,
          color: iconColor?? Colors.black87,
          size: 18,
        ),
      )
    );
  }


  static Color hexToColor(String? code) {
    //先判断是否符合#RRGGBB的要求如果不符合给一个默认颜色
    if (code==null||code==''|| code.length != 7) {
      return const Color(0xFFFF0000); //定了一个默认的主题色常量
    }
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  ///创建Material风格的color
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }

  /// 颜色检测只保存 #RRGGBB格式 FF透明度
  /// [color] 格式可能是材料风/十六进制/string字符串
  /// 返回[String] #rrggbb 字符串
  static String? color2HEX(Object color) {
    if (color is Color) {
      // 0xFFFFFFFF
      //将十进制转换成为16进制 返回字符串但是没有0x开头
      String temp = color.value.toRadixString(16);
      color = '#${temp.substring(2, 8)}';
    }
    return color.toString();
  }
}