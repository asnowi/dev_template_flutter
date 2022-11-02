import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';
import 'package:dev_template_flutter/common/widget/state/state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainController extends BaseGetController{

  @override
  bool get enablePullUp => true;

  final RefreshController refreshController = RefreshController();

  final PageController gridPageController = PageController(initialPage: 0,viewportFraction: 1, keepPage: true);

  List<String> itemList = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    loadState = LoadState.loading;
    updateRefresh();
    initPullLoading();
    super.onReady();
  }


  void onBadgeChange(BuildContext context,String? num) {
    context.read<BadgeMineModel>().onChange(num);
  }

  @override
  void initPullLoading() {
    DelayedUtils.delayed(() {
      for(int i = 1; i <= 10; i++) {
        itemList.add(i.toString());
      }
      loadState = LoadState.success;
      super.initPullLoading();
    });
  }

  @override
  void onRefresh() {
    DelayedUtils.delayed(() {
      itemList.clear();
      for(int i = 1; i <= 10; i++) {
        itemList.add(i.toString());
      }
      if(refreshController.isRefresh){
        refreshController.refreshCompleted(resetFooterState: true);
      }
      super.onRefresh();
    });
  }

  @override
  void onLoadMore() {
    DelayedUtils.delayed(() {
      for(int i = 11; i <= 20; i++) {
        itemList.add(i.toString());
      }
      if(refreshController.isLoading) {
        refreshController.loadComplete();
      }
      super.onLoadMore();
    });
  }

  @override
  void onRetry() {
    loadState = LoadState.loading;
    updateRefresh();
    initPullLoading();
  }
}
