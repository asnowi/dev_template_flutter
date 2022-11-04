import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'db.dart';

class DBUtil{
  /// 实例
  static DBUtil? instance;

  /// 用户信息
  late Box userBox;
  // 搜索记录
  late Box searchBox;

  /// 初始化，需要在 main.dart 调用
  /// <https://docs.hivedb.dev/>
  static Future<void> install() async {
    /// 初始化数据库地址
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    /// 注册自定义对象（实体）
    /// <https://docs.hivedb.dev/#/custom-objects/type_adapters>
    /// Hive.registerAdapter(SettingsAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(SearchAdapter());
  }

  /// 初始化 Box
  static Future<DBUtil?> getInstance() async {
    if (instance == null) {
      instance = DBUtil();
      // await Hive.initFlutter();
      instance?.userBox = await Hive.openBox('user');
      instance?.searchBox = await Hive.openBox('search');
    }
    return instance;
  }

  //---------用户信息----------------
  Future<int?> saveUser(User user) async{
    LogUtils.GGQ('------saveUser------>>>${user.toString()}');
    return Global.dbUtil?.userBox.add(user);
  }

  Future<User?> getUser() async{
    final users = Global.dbUtil?.userBox.values;
    if(users != null && users.isNotEmpty){
      return users.last;
    }
    return null;
  }

  Future<bool> clearUser() async{
    int? result = await Global.dbUtil?.userBox.clear();
    LogUtils.GGQ('---clearUser-->${result}');
    if(result != null && result >= 0) {
      return true;
    }
    return false;
  }

//---------↑-↑-↑-user-↑-↑-↑----------------

//---------搜索记录----------------

  Future<int?> saveSearch(Search search) async{
    LogUtils.GGQ('------saveSearch------>>>${search.toString()}');
    List<Search> list = getSearchList();
    if(list.length >= 5) {
      await removeSearchByIndex(0);
    }
    return Global.dbUtil?.searchBox.add(search);
  }

  List<Search> getSearchList(){
    List<Search> list = [];
    final values = Global.dbUtil?.searchBox.values;
    LogUtils.GGQ('========getSearchList========>${values?.length}');
    if(values != null) {
      for (var element in values) {
        final search = (element as Search);
        list.add(search);
      }
    }
    return list;
  }

  Future<bool> clearSearch() async{
    int? result = await Global.dbUtil?.searchBox.clear();
    LogUtils.GGQ('---clearSearch-->${result}');
    if(result != null && result >= 0) {
      return true;
    }
    return false;
  }

  Future<void> removeSearchByIndex(int index) {
    return Global.dbUtil?.searchBox.deleteAt(index)?? Future<void>(() => 0);
  }

//---------↑-↑-↑-search-↑-↑-↑----------------


}