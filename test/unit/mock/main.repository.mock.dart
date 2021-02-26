import 'package:gitstars/core/enums/loading.enum.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/models/userstars.params.dart';
import 'package:gitstars/src/main/repositories/main.repository.dart';

import '../../mock/mockdata.dart';

class MainRepositoryMock extends IMainRepository {
  ELoadingStatus _loadingStatus = ELoadingStatus.completed;

  @override
  Future<UserStarsModel> fetchUserInfo(UserStarsParams _params) async {
    _loadingStatus = ELoadingStatus.loading;
    var result = await MockData().getData();
    _loadingStatus = ELoadingStatus.completed;

    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

  ELoadingStatus get loadingStatus => _loadingStatus;
}
