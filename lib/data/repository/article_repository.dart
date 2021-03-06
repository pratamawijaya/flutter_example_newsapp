import 'package:flutter_newsapp_example/data/datasource/article_remote_datasource.dart';
import 'package:flutter_newsapp_example/data/mapper/article_mapper.dart';
import 'package:flutter_newsapp_example/domain/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getTopHeadlines(
      String country, String category, int page);
}

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDatasource articleRemoteDatasource;
  final ArticleMapper articleMapper;

  ArticleRepositoryImpl({this.articleRemoteDatasource, this.articleMapper});

  @override
  Future<List<Article>> getTopHeadlines(
      String country, String category, int page) async {
    var result =
        await articleRemoteDatasource.getTopHeadlines(country, category, page);
    return articleMapper.toListDomain(result);
  }
}

class FakeArticleRepository implements ArticleRepository {
  @override
  Future<List<Article>> getTopHeadlines(
      String country, String category, int page) {
    return Future.delayed(Duration(seconds: 1), () {
      List<Article> fakeArticles = List<Article>();

      fakeArticles.add(Article(
          author: "Dan Caplinger",
          title:
              "Buy the Tesla Dip? This 5-Star Investing Guru Just Did - Motley Fool",
          description: "When opportunity strikes, star performers step up.",
          url:
              "https://www.fool.com/investing/2021/01/31/buy-the-tesla-dip-this-5-star-investing-guru-just/",
          urlToImage:
              "https://g.foolcdn.com/editorial/images/610703/tsla-charging-station.jpg",
          publishedAt: "2021-01-31T05:32:00Z",
          content:
              "Shares of Tesla (NASDAQ:TSLA) climbed more than 700% in 2020. However, that has some people wondering whether the stock isn't due for a downturn. Indeed, those concerns took shape last week, as Tesla… [+3956 chars]"));

      return fakeArticles;
    });
  }
}
