import 'package:gitstars/core/config.dart';

class ApiRoutes {
  static String get baseUrl => AppConfig.PRODUCTION ? _productionBaseUrl : _homologBaseUrl;

  //Homologation
  static const String _homologBaseUrl = "https://api.github.com/graphql";
  //Production
  static const String _productionBaseUrl = "https://api.github.com/graphql";

  ////////////////////////////
  // Start of Main Routes //
  ////////////////////////////

  static const String USER_LOGIN = "user/login/";
}
