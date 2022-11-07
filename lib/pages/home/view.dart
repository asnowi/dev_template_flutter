import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';
import 'package:dev_template_flutter/common/widget/tab/tab.dart';
import 'package:flutter/services.dart';

import 'home.dart';

class HomeView extends BaseGetView<HomeController> {

  HomeView({super.key});

  DateTime? _popTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      onWillPop: () async {
        if(_popTime == null || DateTime.now().difference(_popTime!) > const Duration(seconds: 1)){
          //两次点击时间间隔超过1秒则重新计时
          _popTime = DateTime.now();
          // ToastUtils.showToast('再按一次退出');
          ToastUtils.showBar('再按一次退出！');
          return false;
        }
        // 退出app
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
    );
  }

  Widget _buildPageView() {
    return PageView(
        physics: const NeverScrollableScrollPhysics(),
        //横向滑动切换
        scrollDirection: Axis.horizontal,
        controller: controller.pageController,
        children: controller.pageList,
        onPageChanged: (page) => controller.onPageChanged(page));
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    final double itemWidth = getWidth() / 2;
    return BottomAppBar(
      elevation: 6,
      notchMargin: 6.0,
      shape: const CustomCircularNotchedRectangle(),
      child: Row(
        children: [
          SizedBox(height: 48.h, width: itemWidth, child: _buildItemBar<BadgeNoneModel>(0,const ValueKey<String>('nav_main'))),
          SizedBox(height: 48.h, width: itemWidth, child: _buildItemBar<BadgeMineModel>(1,const ValueKey<String>('nav_mine'))),
        ],
      ),
    );
  }

  Widget _buildItemBar<T extends BadgerProviderModel>(int page,ValueKey<String> badgeKey) {
    return MaterialButton(onPressed: (){
      controller.onJumpToPage(page);
    },
        splashColor: Colors.blueGrey.shade100,
        highlightColor: Colors.blueGrey.shade50,
        elevation: 4.0,
        shape: const CircleBorder(),
        child: _buildItemBox<T>(page,badgeKey)
    );
  }

  Widget _buildItemBox<T extends BadgerProviderModel>(int page,ValueKey<String> badgeKey) {
    return Center(
      child: GetBuilder<HomeController>(
        id: 'navigator',
        builder: (_) => BadgeView<T>(
            badgeKey,
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildIcon(page),
                  _buildLabel(page),
                ],
              ),
            )
        )
      )
    );
  }

  Widget _buildIcon(int page) {
    // return Image.asset(controller.tabIcon[index], width: 24.w, height: 24.h,color: controller.currentIndex == index ? Colors.blue: Colors.grey);
    return Image.asset(controller.currentPage == page? controller.tabActive[page]: controller.tabNormal[page], width: 24.w, height: 24.h);
  }

  Widget _buildLabel(int page) {
    return Text(controller.tabLabel[page],style: TextStyle(fontSize: 12.sp,color: controller.currentPage == page ? Colors.blue : Colors.grey));
  }

}