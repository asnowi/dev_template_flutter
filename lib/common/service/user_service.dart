import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/db/db.dart';
import 'package:get/get.dart';

class UserService extends GetxService {

  static UserService get to => Get.find();


  @override
  void onInit() async {
    Global.user = await getUser();
    super.onInit();
  }


  Future<User?> getUser() async{
    if(Global.user != null) {
      return Future(() => Global.user);
    }
    Global.user = await Global.dbUtil?.getUser();
    return Future(() => Global.user);
  }

  Future<bool?> clearUser() async {
    Global.user = null;
    return await Global.dbUtil?.clearUser();
  }

  Future<bool?> updateUser(User? user) async{
    if(user == null) return Future(() => false);
    int result = await Global.dbUtil?.saveUser(user)?? 0;
    return Future(() => result > 0) ;
  }

}