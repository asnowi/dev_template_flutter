import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/widget/state/state.dart';
import 'package:flutter/widgets.dart';

abstract class BaseGetView<T extends BaseGetController> extends GetView<T>{
  BaseGetView({Key? key}) : super(key: key);

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