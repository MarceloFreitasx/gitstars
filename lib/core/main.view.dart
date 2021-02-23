import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitstars/core/routes/routes.dart';
import 'package:gitstars/core/styles/styles.dart';

import 'bindings/initial.binding.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GitStars',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      getPages: PagesRoutes.routes,
      defaultTransition: PagesRoutes.DEFAULT_TRANSITION,
      transitionDuration: PagesRoutes.DEFAULT_TRANSITION_DURATION,
      initialRoute: PagesRoutes.INITIAL,
      initialBinding: InitialBinding(),
    );
  }
}
