import 'package:get/get.dart';
import 'package:gitstars/core/enums/loading.enum.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/models/userstars.params.dart';
import 'package:gitstars/src/main/repositories/main.repository.dart';

abstract class IMainStore extends GetxController {
  Future<bool> fetchUserStars(UserStarsParams _params);
  ELoadingStatus get loadingStatus;
  UserStarsModel get userStarsModel;
  bool get showSearch;
  set showSearch(bool value);
  bool get userLoaded;
  bool get showUserBio;
  set showUserBio(bool value);
}

class MainStore extends IMainStore {
  MainStore(this._repository);

  IMainRepository _repository;

  final _loadingStatus = ELoadingStatus.completed.obs;
  final _user = UserStarsModel().obs;
  final _userLoaded = false.obs;
  final _showSearch = false.obs;
  final _showUserBio = false.obs;

  @override
  Future<bool> fetchUserStars(UserStarsParams _params) async {
    _userLoaded.value = false;
    _loadingStatus.value = ELoadingStatus.loading;
    return await _repository.fetchUserInfo(_params).then((value) {
      if (value != null) {
        _user.value = value;
        _userLoaded.value = true;
        _user.value.starredRepositories.nodes.sort((a, b) => b.pushedAt.compareTo(a.pushedAt));
      }
      _loadingStatus.value = _repository.loadingStatus;
      return value != null;
    });
  }

  @override
  ELoadingStatus get loadingStatus => _loadingStatus.value;

  @override
  UserStarsModel get userStarsModel => _user.value;

  @override
  bool get showSearch => _showSearch.value;

  @override
  set showSearch(bool value) => _showSearch.value = value;

  @override
  bool get userLoaded => _userLoaded.value;

  @override
  bool get showUserBio => _showUserBio.value;

  @override
  set showUserBio(bool value) => _showUserBio.value = value;
}
