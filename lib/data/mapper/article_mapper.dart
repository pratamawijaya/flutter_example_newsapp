import 'package:flutter_newsapp_example/data/models/article_model.dart';
import 'package:flutter_newsapp_example/domain/article.dart';

class ArticleMapper {
  Article toDomain(ArticleModel model) {
    return Article(
        author: model.author,
        title: model.title,
        description: model.description,
        url: model.url,
        urlToImage: model.urlToImage,
        publishedAt: model.publishedAt,
        content: model.content);
  }

  List<Article> toListDomain(List<ArticleModel> models) {
    List<Article> domains = new List<Article>();

    models.forEach((element) {
      domains.add(toDomain(element));
    });
  }
}
