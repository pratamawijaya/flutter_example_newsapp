import 'package:dio/dio.dart';

class NewsApi {
  static const _base_url = "http://newsapi.org/v2/";
  final String _api_key = "";

  final Dio _dio;

  NewsApi(this._dio);

  Future<Response<String>> getTopHeadlines(
      String country, String category) async {
    final String url =
        "$_base_url/top-headlines?country=$country&category=$category&apiKey=$_api_key";
    return _dio.get(url);
  }
}
