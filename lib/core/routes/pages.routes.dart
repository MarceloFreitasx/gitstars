import 'package:get/route_manager.dart';
import 'package:gitstars/src/splash/views/splash.view.dart';

import 'app.routes.dart';

abstract class PagesRoutes {
  //Initial Route
  static const DEFAULT_TRANSITION = Transition.cupertino;
  static const DEFAULT_TRANSITION_DURATION = Duration(milliseconds: 450);
  static const INITIAL = AppRoutes.SPLASH_SCREEN;

  static final routes = [
    // GetPage(name: AppRoutes.MAIN, page: () => MainView()),
    GetPage(name: AppRoutes.SPLASH_SCREEN, page: () => SplashView()),
  ];
}
