import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/unknown/unknown.dart';
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
        page: () => IndexView(),
        binding: IndexBinding()
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

    /// 蓝牙页
    GetPage(
        name: AppRoutes.BLUETOOTH,
        page: () => BluetoothView(),
        binding: BluetoothBinding(),
        transition: Transition.fadeIn,
    ),

    /// Web
    GetPage(
      name: AppRoutes.WEB,
      page: () => WebView(),
      binding: WebBinding(),
      transition: Transition.fadeIn,
    ),

   //// 测试
   GetPage(
        name: AppRoutes.TEST,
        page: () => TestView(),
        binding: TestBinding(),
        transition: Transition.fadeIn
   ),

    /// 首页
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        bindings: [YouBinding(),PushBinding(),MessageBinding(),MineBinding()],
        children: [
          GetPage(
              name: AppRoutes.HOME_YOU,
              page: () => YouView(),
              binding: YouBinding()
          ),
          GetPage(
              name: AppRoutes.HOME_PUSH,
              page: () => PushView(),
              binding: PushBinding()
          ),
          GetPage(
              name: AppRoutes.HOME_MESSAGE,
              page: () => MessageView(),
              binding: MessageBinding()
          ),
          GetPage(
              name: AppRoutes.HOME_MINE,
              page: () => MineView(),
              binding: MineBinding()
          ),
        ]
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