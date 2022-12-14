import 'dart:async';

import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/config/config.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/state/state.dart';

class BaseGetController extends GetxController {

  /// 加载状态
  var loadState = LoadState.loading;

  //  允许下拉
  bool _enablePullDown = true;
  bool get enablePullDown => _enablePullDown;
       set enablePullDown(bool value) => _enablePullDown = value;

  //  允许上拉加载
  bool _enablePullUp = false;
  bool get enablePullUp => _enablePullUp;
       set enablePullUp(bool value) => _enablePullUp = value;

  bool hasNetworkState = false;

  StreamSubscription<CommonEvent>? _eventSubscription;

  @override
  void onInit() {
    if(hasNetworkState && (Global.isAndroid || Global.isIOS)) {
      _eventSubscription = EventBusUtils.listen<CommonEvent>((event) {
        LogUtils.GGQ('========EventBusUtils========>>>${event.code}');
        if(EventCode.EVENT_NETWORK == event.code) {
          if(!UIUtils.isEmpty(event.message)) {
            networkChanged(event.message!);
          }
        }
      });
    }
    super.onInit();
  }

  void networkChanged(String status) {}


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    if(hasNetworkState && (Global.isAndroid || Global.isIOS)) {
      _eventSubscription?.cancel();
    }
    super.onClose();
  }

  void initPullLoading(){
    updateRefresh();
  }

  void onRetry(){
    updateRefresh();
  }

  void onRefresh() {
    updateRefresh();
  }

  void onLoadMore() {
    updateRefresh();
  }

  void updateRefresh(){
     update(['refresh']);
  }




// void onRefresh() {
//   DelayedUtils.delayed(() {
//     if(_refreshController.isRefresh){
//       _refreshController.refreshCompleted(resetFooterState: true);
//     }
//   });
// }
// final Random random = Random();
//
// void onLoadMore() {
//   final num = random.nextInt(3); // 0,1,2
//   DelayedUtils.delayed(() {
//     if(_refreshController.isLoading){
//       if(num == 1) {
//         _refreshController.loadNoData();
//       } else if(num == 2){
//         _refreshController.loadFailed();
//       } else {
//         _refreshController.loadComplete();
//       }
//     }
//   });
// }
}