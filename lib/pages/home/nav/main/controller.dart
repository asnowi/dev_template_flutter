import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/router/router.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';
import 'package:dev_template_flutter/common/widget/state/state.dart';
import 'package:dev_template_flutter/pages/preview/widget/widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  List<String> gridList1 = ['fl_chart','preview','3','4','5','6'];
  List<String> gridList2 = ['11','22','33','44','55'];

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

  void onSearch(BuildContext context) {
    Get.toNamed(AppRoutes.SEARCH,arguments: {
      'search':'啊啊啊'
    });
  }

  void onBanner(index) {
    ToastUtils.show(index.toString());
  }

  void onScan() {
    // 申请相机权限
    PermissionUtil.checkPermissions([Permission.photos,Permission.camera],onSuccess: () async{
      Get.toNamed(AppRoutes.SCANNER);
    },onFailed: () {
      ToastUtils.show('请同意使用相机和访问照片的权限');
    },onSetting: () {
      UIUtils.openSettings();
    });
  }

  void onLocation() {
    Get.toNamed(AppRoutes.LOCATION);
  }

  void onGridItem(int page, int index) {
    if(page == 1) {
      switch(index){
        case 0: {
          ToastUtils.show('aaaa');
          break;
        }
        case 1: {
          List<Photo> photos = [
            Photo(url: 'https://picsum.photos/seed/picsum/200?random=${RandomUtils.to.random}',title: '图片1'),
            Photo(url: 'https://picsum.photos/seed/picsum/200?random=${RandomUtils.to.random}',title: '图片2'),
            Photo(url: 'https://picsum.photos/seed/picsum/200?random=${RandomUtils.to.random}',title: '图片3'),
          ];
          Get.toNamed(AppRoutes.PREVIEW,arguments: {'photos': photos});
          break;
        }
        default: {
          ToastUtils.show(gridList1[index]);
        }
        break;
      }
    } else if(page == 2) {
      switch(index){
        case 0: {
          ToastUtils.show('第二页（1）');
          break;
        }
        default: {
          ToastUtils.show(gridList2[index]);
        }
        break;
      }
    }
  }
}
