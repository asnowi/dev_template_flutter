import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/error/error.dart';
import 'package:dev_template_flutter/pages/home/home.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:dev_template_flutter/pages/home/nav/mine/mine.dart';
import 'package:dev_template_flutter/pages/login/login.dart';
import 'package:dev_template_flutter/pages/splash/splash.dart';
import 'package:dev_template_flutter/pages/unknown/unknown.dart';
import 'package:dev_template_flutter/pages/userInfo/userInfo.dart';
import 'package:dev_template_flutter/pages/welcome/welcome.dart';
import 'package:get/get.dart';


import 'router.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  /// 路由初始页
  static const INITIAL = AppRoutes.INDEX;

  //页面跳转动画时长
  static const Duration _transitionDuration = Duration(milliseconds: 300);

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
              binding: MainBinding()
          ),
          GetPage(
              name: AppRoutes.HOME_MINE,
              page: () => MineView(),
              binding: MineBinding()
          ),
        ]
    ),

    /// 用户详情
    GetPage(
      name: AppRoutes.USER_INFO,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
      transition: Transition.fadeIn,
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
    transition: Transition.fadeIn);
  }
}