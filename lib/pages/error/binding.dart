import 'package:get/get.dart';

import 'error.dart';

class ErrorBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ErrorController>(() => ErrorController());

  }

}