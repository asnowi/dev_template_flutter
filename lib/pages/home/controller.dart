
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:dev_template_flutter/pages/home/nav/mine/mine.dart';
import 'package:provider/single_child_widget.dart';

class HomeController extends BaseGetController with GetSingleTickerProviderStateMixin{

  late PageController pageController;

  int currentPage = 0;

  final List<Widget> pageList = [
    MainView(),
    MineView(),
  ];

  final List<String> tabActive = [
    AssetsProvider.iconPath('nav_main_active'),
    AssetsProvider.iconPath('nav_mine_active'),
  ];

  final List<String> tabNormal = [
    AssetsProvider.iconPath('nav_main_normal'),
    AssetsProvider.iconPath('nav_mine_normal'),
  ];

  final List<String> tabLabel = [
    '首页',
    '我的',
  ];


  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage,viewportFraction: 1, keepPage: true);
    pageController.addListener(() {
      LogUtils.GGQ('------pageController---->>>${pageController.position}');
    });
    super.onInit();
  }

  @override
  void onReady() async{
    super.onReady();
  }

  void onPageChanged(int page) {
    currentPage = page;
    update(['navigator']);
  }
  // 切换视图
  void onJumpToPage(int page) {
    pageController.animateToPage(page, duration: const Duration(milliseconds: 50), curve: Curves.linear);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

}