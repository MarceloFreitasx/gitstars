import 'package:get/instance_manager.dart';
import 'package:gitstars/core/services/api.service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    // Get.lazyPut<SplashController>(() => SplashController());
  }
}
