import 'package:gitstars/core/enums/loading.enum.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/models/userstars.params.dart';
import 'package:gitstars/src/main/stores/main.store.dart';

import '../../mock/mockdata.dart';

class MainStoreMock extends IMainStore {
  var _loadingStatus = ELoadingStatus.completed;
  var _user = UserStarsModel();
  var _userLoaded = false;

  @override
  bool showSearch;

  @override
  bool showUserBio;

  @override
  Future<bool> fetchUserStars(UserStarsParams _params) async {
    _user = await MockData().getData();
    _userLoaded = true;
    return true;
  }

  @override
  ELoadingStatus get loadingStatus => _loadingStatus;

  @override
  bool get userLoaded => _userLoaded;

  @override
  UserStarsModel get userStarsModel => _user;
}
