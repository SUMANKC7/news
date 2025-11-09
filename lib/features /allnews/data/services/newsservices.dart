import 'package:dio/dio.dart';
import 'package:weatherapp/core/services/apiclient.dart';

class Newsservices {
  final Apiclient apiclient;
  Newsservices(this.apiclient);

  Future<Response> fetchNews({
    required String endpoint,
    required Map<String, dynamic> params,
  }) {
    return apiclient.getNews(endpoint, params);
  }
}
