import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/tab/tab.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:dev_template_flutter/pages/home/nav/mine/mine.dart';
import 'package:flutter/services.dart';


import 'home.dart';

class HomeView extends BaseGetView<HomeController> {

  HomeView({super.key});

  DateTime? _popTime;

  final List<Widget> _pageList = [
    MainView(),
    MineView(),
  ];

  final List<String> _tabActive = [
    AssetsProvider.iconPath('nav_main_active'),
    AssetsProvider.iconPath('nav_mine_active'),
  ];

  final List<String> _tabNormal = [
    AssetsProvider.iconPath('nav_main_normal'),
    AssetsProvider.iconPath('nav_mine_normal'),
  ];

  final List<String> _tabLable = [
    '首页',
    '我的',
  ];

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
    return GetBuilder<HomeController>(
        id: 'navigator',
        builder: (_) => PageView(
            physics: const NeverScrollableScrollPhysics(),
            //横向滑动切换
            scrollDirection: Axis.horizontal,
            controller: controller.pageController,
            children: _pageList,
            onPageChanged: (page) {
              LogUtils.GGQ('page-->>>:${page}');
              controller.onChangePage(page);
            })
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    final double itemWidth = getWidth() / 2;
    return BottomAppBar(
      elevation: 6,
      notchMargin: 6.0,
      color: Colors.white,
      shape: const CustomCircularNotchedRectangle(),
      child: Row(
        children: [
          SizedBox(height: 52.h, width: itemWidth, child: _buildItemBar(0)),
          SizedBox(height: 52.h, width: itemWidth, child: _buildItemBar(1)),
        ],
      ),
    );
  }

  Widget _buildItemBar(int index) {
    return MaterialButton(onPressed: (){
      controller.onJumpToPage(index);
    },
        splashColor: Colors.blueGrey.shade100,
        highlightColor: Colors.blueGrey.shade50,
        elevation: 4.0,
        shape: const CircleBorder(),
        child: _buildItemBox(index)
    );
  }

  Widget _buildItemBox(int index) {
    return Center(
      child: GetBuilder<HomeController>(
        id: 'navigator',
        builder: (_) => Container(
          width: 48.w, height: 48.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.currentIndex == index ? Image.asset(_tabActive[index], width: 22.w, height: 22.h): Image.asset(_tabNormal[index], width: 22.w, height: 22.h),
              controller.currentIndex == index? Text(_tabLable[index],style: TextStyle(fontSize: 14.sp,color: Colors.blue)): Text(_tabLable[index],style: TextStyle(fontSize: 14.sp,color: Colors.grey)),
            ],
          )
        ),
      ),
    );
  }
}