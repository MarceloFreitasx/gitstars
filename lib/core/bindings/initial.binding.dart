import 'package:get/instance_manager.dart';
import 'package:gitstars/core/services/api.service.dart';
import 'package:gitstars/src/splash/controllers/splash.controller.dart';
import 'package:gitstars/src/splash/stores/splash.store.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());

    Get.lazyPut(() {
      Get.put(SplashStore());
      return SplashController(Get.find());
    });
  }
}
