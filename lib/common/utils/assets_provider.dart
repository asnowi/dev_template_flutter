import 'package:dev_template_flutter/common/http/http.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter/services.dart' show rootBundle;

class AssetsProvider{

  ///本地图片路径
  static String imagePath(String name,{String type = 'png'}){
    return 'assets/images/$name.$type';
  }

  static String iconPath(String name,{String type = 'png'}){
    return 'assets/icons/$name.$type';
  }

  ///本地json动画
  static String lottiePath(String name){
    return 'assets/json/$name.json';
  }

  /// 本地json 数据
  static String loadJson(String name){
    return 'assets/data/$name.json';
  }

  /// 本地视频
  static String loadVideo(String name, {String type = 'mp4'}){
    return 'assets/video/$name.$type';
  }

  /// svg
  static String svgPath(String name, {String type = 'svg'}){
    return 'assets/svg/$name.$type';
  }

  static Future<DioResponse> loadData(String fileName) async{
     String data = await rootBundle.loadString('assets/data/$fileName.json');
     await DelayedUtils.delayed(() {
       LogUtils.GGQ('loading...');
     });
    return DioResponse.getResponse(data);
  }

}
