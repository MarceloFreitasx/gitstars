import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gitstars/core/models/apiresponse.model.dart';
import 'package:gitstars/core/routes/api.routes.dart';

abstract class IApi {
  Future<ApiResponseModel> call(
    EApiType type,
    String url, {
    Map<String, dynamic> data,
    Map<String, dynamic> headers,
  });
}

enum EApiType { get, post, put, patch, delete, head }

class ApiService implements IApi {
  ApiService({this.apiRoute}) {
    dio.options.baseUrl = apiRoute ?? ApiRoutes.baseUrl;
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => status < 5000;
    dio.options.sendTimeout = 60 * 1000;
    dio.options.receiveTimeout = 60 * 1000;
  }

  final String apiRoute;
  final Dio dio = Dio();

  Future<ApiResponseModel> call(EApiType type, String url,
      {Map<String, dynamic> data, Map<String, dynamic> headers}) async {
    if (headers != null)
      dio.options.headers = headers;
    else
      dio.options.headers.clear();

    var response;
    var _url = url.contains("http") ? url : "/$url";
    switch (type) {
      case EApiType.get:
        response = await dio.get(_url, queryParameters: data);
        break;
      case EApiType.post:
        response = await dio.post(_url, data: jsonEncode(data));
        break;
      case EApiType.put:
        response = await dio.put(_url, data: jsonEncode(data));
        break;
      case EApiType.patch:
        response = await dio.patch(_url, data: jsonEncode(data));
        break;
      case EApiType.delete:
        response = await dio.delete(_url, data: jsonEncode(data));
        break;
      case EApiType.head:
        response = await dio.head(_url, queryParameters: data);
        break;
    }

    print("======start======");
    print("url: $url");
    print("paramsData: $data");
    print("headers: ${dio.options.headers}");
    print("statusCode: ${response.statusCode}");
    print("responseData: ${response.data}");
    print("=======end=======");

    return new ApiResponseModel(response.data, response.headers, response.statusCode);
  }
}
