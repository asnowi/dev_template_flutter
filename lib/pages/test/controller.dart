import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/widget/state/state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TestController extends BaseGetController {


  final RefreshController refreshController = RefreshController();

  @override
  LoadState get loadState => LoadState.loading;

  @override
  void onReady() {
    super.onReady();
  }
}