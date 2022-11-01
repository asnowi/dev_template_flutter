
import 'package:dev_template_flutter/common/utils/utils.dart';

class AppStyles {

  static TextStyle titleStyleLight = TextStyle(
    fontSize: 16.sp,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  static TextStyle titleStyleDark = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static ButtonStyle getCommonButtonStyle({double? width, double? height}) {
    return ButtonStyle(
      textStyle: MaterialStateProperty.all(TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      )),
      minimumSize: MaterialStateProperty.all(Size(width?? getWidth(), height?? 42.h)),
      foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
          if (states.contains(MaterialState.focused) &&
              !states.contains(MaterialState.pressed)) {
            return Colors.grey[300];
          } else if (states.contains(MaterialState.pressed)) {
            return Colors.white60;
          }
          return Colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.blueAccent[100];
        }
        return Colors.blueAccent[100];
      }),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      )),
    );
  }
}