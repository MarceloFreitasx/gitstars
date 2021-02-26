import 'package:flutter_test/flutter_test.dart';
import 'package:gitstars/core/config.dart';

void main() {
  group("Verificação das configurações voltadas para produção", () {
    test("Conferindo se o access token do github está configurado corretamente", () {
      assert(AppConfig.TOKEN != "PERSONAL_ACCESS_TOKEN");
    });
  });
}
