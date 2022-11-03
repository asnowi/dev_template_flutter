import 'package:dev_template_flutter/common/widget/state/state.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class BaseGetView<T> extends GetView<T>{
  const BaseGetView({Key? key}) : super(key: key);


  Widget buildLoading(){
    return LoadingPage();
  }

  Widget buildEmpty(){
    return const EmptyPage();
  }

  Widget buildError(VoidCallback onRetry) {
    return ErrorPage(onRetry: onRetry);
  }
}