import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/error/error.dart';
import 'package:dev_template_flutter/pages/home/home.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:dev_template_flutter/pages/home/nav/mine/mine.dart';
import 'package:dev_template_flutter/pages/location/location.dart';
import 'package:dev_template_flutter/pages/login/login.dart';
import 'package:dev_template_flutter/pages/scanner/scanner.dart';
import 'package:dev_template_flutter/pages/search/search.dart';
import 'package:dev_template_flutter/pages/setting/setting.dart';
import 'package:dev_template_flutter/pages/splash/splash.dart';
import 'package:dev_template_flutter/pages/test/test.dart';
import 'package:dev_template_flutter/pages/unknown/unknown.dart';
import 'package:dev_template_flutter/pages/userInfo/userInfo.dart';
import 'package:dev_template_flutter/pages/web/web.dart';
import 'package:dev_template_flutter/pages/welcome/welcome.dart';
import 'package:get/get.dart';


import 'router.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  /// 路由初始页
  static const INITIAL = AppRoutes.INDEX;

  //页面跳转动画时长
  static const Duration _transitionDuration = Duration(milliseconds: 150);

  static final List<GetPage> routes = [

    /// 启动页
    GetPage(
        name: INITIAL,
        page: () => SplashView(),
        binding: SplashBinding()
    ),

    /// 欢迎页
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
      transition: Transition.fadeIn,
    ),

    /// 登录页
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
      transitionDuration: _transitionDuration
    ),


    /// 首页
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        bindings: [MainBinding(),MineBinding()],
        children: [
          GetPage(
              name: AppRoutes.HOME_MAIN,
              page: () => MainView(),
          ),
          GetPage(
              name: AppRoutes.HOME_MINE,
              page: () => MineView(),
          ),
        ]
    ),

    /// 用户详情
    GetPage(
      name: AppRoutes.USER_INFO,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: _transitionDuration
    ),

    /// Web
    GetPage(
        name: AppRoutes.WEB,
        page: () => WebView(),
        binding: WebBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: _transitionDuration
    ),

    /// Setting
    GetPage(
        name: AppRoutes.SETTING,
        page: () => SettingView(),
        binding: SettingBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: _transitionDuration
    ),

    /// Location
    GetPage(
        name: AppRoutes.LOCATION,
        page: () => LocationView(),
        binding: LocationBinding(),
        transition: Transition.leftToRight,
        transitionDuration: _transitionDuration
    ),
    /// 扫描二维码
    GetPage(
        name: AppRoutes.SCANNER,
        page: () => ScannerView(),
        binding: ScannerBinding(),
        transition: Transition.fadeIn,
        transitionDuration: _transitionDuration
    ),
    /// Test
    GetPage(
        name: AppRoutes.TEST,
        page: () => TestView(),
        binding: TestBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: _transitionDuration
    ),

    /// 搜索
    GetPage(
        name: AppRoutes.SEARCH,
        page: () => SearchView(),
        binding: SearchBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 10)
    ),

    /// 错误页
    GetPage(
      name: AppRoutes.ERROR,
      page: () => ErrorView(),
      binding: ErrorBinding(),
      transition: Transition.downToUp,
      transitionDuration: _transitionDuration
    ),
  ];


  // 未知页
  static GetPage unknownPage(){
    return GetPage(
      name: AppRoutes.UNKNOWN,
      page: () => UnknownView(),
      binding: UnknownBinding(),
      transition: Transition.fadeIn,
    );
  }
}