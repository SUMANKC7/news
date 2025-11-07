import 'package:dio/dio.dart';

class Apiclient {
  static const baseUrl = "https://newsapi.org/v2/";

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      //Request for connection and wait for 10 seconds to receive connection responsse
      connectTimeout: Duration(seconds: 10),
      //Request for information and wait for 10 seconds to receive response
      receiveTimeout: Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  );

  Future<Response> getNews(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    //It add up baseurl+ endpoint + params
    // https://newsapi.org/v2/ + everything + coming parameters such as filter or types
    return   _dio.get(endpoint,queryParameters: params);
  }
}
