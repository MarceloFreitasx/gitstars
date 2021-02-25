import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';

class Mock {
  _loadData() async {
    final _data = jsonDecode(await rootBundle.loadString("test/mock/data/user.json"))["data"]["user"];
    return UserStarsModel.fromJson(_data);
  }

  getData() async {
    return await _loadData();
  }
}
