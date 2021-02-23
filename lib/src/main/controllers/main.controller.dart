import 'package:gitstars/core/enums/loading.enum.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/models/userstars.params.dart';
import 'package:gitstars/src/main/stores/main.store.dart';

class MainController {
  MainController(this._store) {
    fetch();
  }

  IMainStore _store;

  bool get isLoading => _store.loadingStatus == ELoadingStatus.loading;
  UserStarsModel get userStarsModel => _store.userStarsModel;

  fetch() {
    _store.fetchUserStars(UserStarsParams("marcelofreitasx"));
  }
}
