import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxController {
  StorageService(this.key);

  final String key;
  final _box = GetStorage();

  read() => _box.read(key);

  write(String value) {
    _box.write(key, value);
  }

  remove() {
    _box.remove(key);
  }
}
