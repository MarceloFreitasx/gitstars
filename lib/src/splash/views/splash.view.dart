import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gitstars/core/styles/appcolors.style.dart';
import 'package:gitstars/core/styles/styles.dart';
import 'package:gitstars/src/splash/controllers/splash.controller.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.find();

  @override
  void initState() {
    controller.animationController
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.GRAYEC,
        padding: EdgeInsets.all(40),
        child: Center(
          child: Transform(
            transform: Matrix4.translationValues(0.0, controller.translateLogo.value * 10, 0.0),
            child: Opacity(
              opacity: controller.opacityLogo.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150, child: SvgPicture.asset(AppAssets.GITHUB)),
                  Container(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "GitStars",
                        style: AppStyles.head2,
                      ),
                      Container(width: 5),
                      SvgPicture.asset(AppAssets.STAR, width: 16, height: 16),
                    ],
                  ),
                  Text(
                    "by @MarceloFreitasx",
                    style: AppStyles.caption1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
