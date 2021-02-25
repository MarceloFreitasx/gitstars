import 'package:gitstars/core/enums/loading.enum.dart';
import 'package:gitstars/core/services/api.service.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/models/userstars.params.dart';

abstract class IMainRepository {
  Future<UserStarsModel> fetchUserInfo(UserStarsParams _params);
  ELoadingStatus get loadingStatus;
}

class MainRepository extends IMainRepository {
  MainRepository(this._api);

  IApi _api;
  ELoadingStatus _loadingStatus = ELoadingStatus.completed;

  @override
  Future<UserStarsModel> fetchUserInfo(UserStarsParams _params) async {
    _loadingStatus = ELoadingStatus.loading;
    var result = await _api.call(_params.toJson());

    _loadingStatus = ELoadingStatus.completed;

    if (result != null) {
      return UserStarsModel.fromJson(result["user"]);
    } else {
      return null;
    }
  }

  ELoadingStatus get loadingStatus => _loadingStatus;
}
