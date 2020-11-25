import 'package:dio/dio.dart';

import 'config.dart';

///[Invoke] will hold configration of network,
/// every request will go throw Invoke
class Invoke {
  Dio dio;

  Invoke() {
    dio = new Dio(); // with default Options
    dio.options.baseUrl = Config().endPoint;
    dio.options.connectTimeout = 30000; //5s
    dio.options.receiveTimeout = 30000;
  }

  Future<Response> post(
      {apiUrl, jsonParams = const {}, addAuthHeader = true}) async {
    Map<String, dynamic> header = {};

    //// adding auth token in header
    if (addAuthHeader) header = {'Authorization': 'Token ' + "12344567"};

    Response response = await dio.post(
      apiUrl,
      data: jsonParams,
      options: Options(headers: header),
    );

    return response;
  }

  Future<Response> get({apiUrl, addAuthHeader = true}) async {
    Map<String, dynamic> header = {};

    //// adding auth token in header
    if (addAuthHeader) header = {'Authorization': 'Token ' + "12344567"};

    Response response = await dio.get(
      apiUrl,
      options: Options(headers: header),
    );

    return response;
  }

  Future<Response> put(
      {apiUrl, jsonParams = const {}, addAuthHeader = true}) async {
    Map<String, dynamic> header = {};

    if (addAuthHeader) header = {'Authorization': 'Token ' + "12344567"};

    Response response = await dio.put(
      apiUrl,
      data: jsonParams,
      options: Options(headers: header),
    );

    return response;
  }

  Future<Response> delete(
      {apiUrl, jsonParams = const {}, addAuthHeader = true}) async {
    Map<String, dynamic> header = {};
    //// adding auth token in header
    if (addAuthHeader) header = {'Authorization': 'Token ' + "12344567"};

    Response response = await dio.delete(
      apiUrl,
      data: jsonParams,
      options: Options(headers: header),
    );

    return response;
  }
}
