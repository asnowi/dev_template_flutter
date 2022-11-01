import 'package:dev_template_flutter/common/base/base.dart';

class DialogController extends GetxController{

  bool _isLoading = false;
  bool getLoading() => _isLoading;

  void onLoading(bool loading) {
    _isLoading = loading;
    update(['submit']);
  }


}