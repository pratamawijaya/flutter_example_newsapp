import 'package:flutter_newsapp_example/data/models/article_model.dart';

class NewsApiArticleResponse {
  String status;
  int totalResults;
  List<ArticleModel> articles;

  NewsApiArticleResponse({this.status, this.totalResults, this.articles});

  NewsApiArticleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = (json['totalResults'] as num).toInt();
    if (json['articles'] != null) {
      articles = new List<ArticleModel>();
      json['articles'].forEach((v) {
        articles.add(new ArticleModel.fromJson(v));
      });
    }
  }
}
