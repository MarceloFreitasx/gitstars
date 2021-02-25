import 'package:flutter/material.dart';
import 'package:gitstars/core/enums/loading.enum.dart';
import 'package:gitstars/core/services/storage.service.dart';
import 'package:gitstars/core/utils/utils.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/models/userstars.params.dart';
import 'package:gitstars/src/main/stores/main.store.dart';

class MainController {
  MainController(this._store) {
    if (_storageService.read() != null) {
      userSearch.text = _storageService.read();
      fetch();
    }
  }

  IMainStore _store;
  StorageService _storageService = StorageService("lastSearch");

  bool get isLoading => _store.loadingStatus == ELoadingStatus.loading;
  UserStarsModel get userStarsModel => _store.userStarsModel;
  bool get showSearch => _store.showSearch;
  set showSearch(bool value) => _store.showSearch = value;
  bool get userLoaded => _store.userLoaded;
  bool get showUserBio => _store.showUserBio;

  final userSearch = TextEditingController();

  fetch() {
    if (userSearch.text.length > 3) {
      _storageService.write(userSearch.text);
      _store.fetchUserStars(UserStarsParams(userSearch.text));
      showSearch = false;
      _store.showUserBio = false;
    }
  }

  goToRepo(Node item) {
    Utils.launchUrl(item.url);
  }

  changeUserBio() {
    _store.showUserBio = !_store.showUserBio;
  }
}
