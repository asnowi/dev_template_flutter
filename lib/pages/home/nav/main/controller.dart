import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/router/router.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';
import 'package:dev_template_flutter/common/widget/state/state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainController extends BaseGetController{

  @override
  bool get enablePullUp => true;

  final RefreshController refreshController = RefreshController();

  final PageController gridPageController = PageController(initialPage: 0,viewportFraction: 1, keepPage: true);

  List<String> itemList = [];

  List<String> bannerList = [
    'https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500',
    'https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500',
    'https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500',
    'https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
  ];

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

  void onSearch() {
    Get.toNamed(AppRoutes.SEARCH,arguments: {
      'search':'啊啊啊'
    });
  }

  void onBnnner(index) {
    ToastUtils.show(index.toString());
  }

  void onScan() {
    ToastUtils.show('scan');
  }

  void onLocation() {
    ToastUtils.show('位置');
  }
}
