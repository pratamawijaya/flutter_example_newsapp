import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class NewsApi {
  static const baseUrl = "http://newsapi.org/v2";
  final String apiKey = "4b4df2ea3a154950852b6fda536cfb7f";

  final Dio _dio;

  NewsApi(this._dio);

  Future<Response<String>> getTopHeadlines(
      String country, String category) async {
    final String url =
        "$baseUrl/top-headlines?country=$country&category=$category&apiKey=$apiKey";
    developer.log("log me ", name: "urlnya -> $url");
    return _dio.get(url);
  }
}
