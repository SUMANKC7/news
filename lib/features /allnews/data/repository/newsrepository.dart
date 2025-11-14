import 'dart:developer';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/data/services/newsservices.dart';

class NewsRepository {
  final Newsservices newsservices;
  const NewsRepository(this.newsservices);

  Future<List<AllnewsModel>> fetchNews({
    String? category,
    String? sources,
  }) async {
    final params = <String, dynamic>{};
    params["sources"] = "techcrunch";

    if (category != null && category.isNotEmpty) {
      params["category"] = category;
    }
    try {
      final response = await newsservices.fetchNews(
        endpoint: "top-headlines",
        params: params,
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data["articles"];
        log("Data:$jsonResponse");
        return jsonResponse
            .map((newsarticle) => AllnewsModel.fromJson(newsarticle))
            .toList();
      } else {
        throw Exception(
          "Failed to fetch the data: Status code ${response.statusCode}",
        );
      }
    } catch (e) {
      log("There is some error while fetching the headlines ");
      rethrow;
    }
  }

  Future<List<AllnewsModel>> discoverNews(String category) async {
    final params = <String, dynamic>{};
    params["country"] = "us";
    if (category.isNotEmpty) {
      params["category"] = category;
    } else {
      params["category"] = "all";
    }
    try {
      final response = await newsservices.fetchNews(
        endpoint: "top-headlines",
        params: params,
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data["articles"];
        return jsonResponse
            .map((newsarticle) => AllnewsModel.fromJson(newsarticle))
            .toList();
      } else {
        throw Exception(
          "Failed to fetch the data: Status code ${response.statusCode}",
        );
      }
    } catch (e) {
      log("Failed to load data ");
      rethrow;
    }
  }

  Future<List<AllnewsModel>> searchNews(String? query) async {
    final userquery = <String, dynamic>{};
    if (query != null && query.isNotEmpty) {
      userquery["q"] = query;
      userquery["from"] = "2025-10-11";
      userquery["sortBy"] = "publishedAt";
    }

    try {
      final response = await newsservices.fetchNews(
        endpoint: "everything",
        params: userquery,
      );
      if (response.statusCode == 200) {
        final jsonResponse = response.data["articles"];
        log(jsonResponse);
        return jsonResponse
            .map((newsarticle) => AllnewsModel.fromJson(newsarticle))
            .toList();
      } else {
        throw Exception(
          "Failed to search the data: Status code ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Error occurred while searcjhing data $e");
    }
  }
}
