import 'package:flutter/material.dart';
import 'package:flutter_newsapp_example/domain/article.dart';

class ArticleModel extends Article {
  ArticleModel(
      {required String? author,
      required String? title,
      required String? description,
      required String? url,
      required String? urlToImage,
      required String? publishedAt,
      required String? content})
      : super(
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);
  }
}
