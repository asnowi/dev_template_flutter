import 'package:dev_template_flutter/common/http/http.dart';

class ApiService{
  /// 用户登录
  static Future<DioResponse>login (
      String username,
      String password) async{
    return await DioUtil().request<DioResponse>('/api/core/user/login',method: DioMethod.post,data: {
      'username': username,
      'password': password,
    },hasShowLoading: false);
  }

  /// 用户退出
  static Future<DioResponse>logout() async{
    return await DioUtil().request<DioResponse>('/api/core/user/logout',method: DioMethod.post, hasShowLoading: false);
  }
}