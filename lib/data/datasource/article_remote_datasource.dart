import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_newsapp_example/data/models/article_model.dart';
import 'package:flutter_newsapp_example/data/models/response/newsapi_article_response.dart';
import 'package:flutter_newsapp_example/data/service/news_api.dart';

abstract class ArticleRemoteDatasource {
  Future<List<ArticleModel>> getTopHeadlines(String country, String category);
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDatasource {
  final NewsApi api;

  ArticleRemoteDataSourceImpl({this.api});

  @override
  Future<List<ArticleModel>> getTopHeadlines(
      String country, String category) async {
    var response = await api.getTopHeadlines(country, category);

    var parseResult =
        NewsApiArticleResponse.fromJson(json.decode(response.data));

    throw parseResult.articles;
  }
}
