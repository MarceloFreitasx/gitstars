import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitstars/core/routes/routes.dart';
import 'package:gitstars/src/splash/stores/splash.store.dart';

class SplashController {
  SplashController(this._store) {
    animationController.forward();
    changeRoute();
  }

  SplashStore _store;

  AnimationController get animationController => _store.animationController;
  Animation<double> get opacityLogo => _store.opacityLogo;
  Animation<double> get translateLogo => _store.translateLogo;

  changeRoute() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.MAIN);
    });
  }
}
