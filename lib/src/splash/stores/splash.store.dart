import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashStore extends GetxController with SingleGetTickerProviderMixin {
  SplashStore() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    opacityLogo = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    translateLogo = Tween<double>(begin: 1.0, end: 0.0).animate(animationController);
  }

  AnimationController animationController;
  Animation<double> opacityLogo;
  Animation<double> translateLogo;
}
