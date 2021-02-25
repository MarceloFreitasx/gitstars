import 'package:flutter_test/flutter_test.dart';
import 'package:gitstars/core/enums/loading.enum.dart';

import 'mock/main.store.mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Testes regras de negocio/lógica do módulo principal", () {
    test("Validação repository", () {});
    test("Validação store", () {
      MainStoreMock store = MainStoreMock();

      assert(store.userLoaded == false);
      store.fetchUserStars(null);
      assert(store.loadingStatus == ELoadingStatus.completed);
      assert(store.userStarsModel != null);
    });
  });
}
