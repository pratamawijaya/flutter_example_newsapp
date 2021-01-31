import 'package:flutter_newsapp_example/data/repository/article_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ArticleRepository>(FakeArticleRepository());
}
