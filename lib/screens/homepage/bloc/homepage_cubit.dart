import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_newsapp_example/data/repository/article_repository.dart';
import 'package:flutter_newsapp_example/domain/article.dart';
import 'dart:developer' as d;

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  ArticleRepository _articleRepository;
  List<Article> _articles = new List<Article>();
  int _currentPage = 1;
  final String category = "technology";
  final String country = "us";

  HomepageCubit(this._articleRepository) : super(HomepageInitial());

  void loadMore() async {
    _currentPage = _currentPage + 1;
    d.log('log me', name: "loadmore $_currentPage");

    final result = await _articleRepository.getTopHeadlines(
        country, category, _currentPage);

    d.log('log me', name: 'articles size ${_articles.length}');

    emit(HomepageLoaded(articles: _articles + result, hasRearchMax: false));
  }

  void getTopHeadlines() async {
    emit(HomepageLoading());

    final result = await _articleRepository.getTopHeadlines(
        country, category, _currentPage);
    _articles.addAll(result);

    d.log('log me', name: 'articles -> ' + _articles[0].title);

    emit(HomepageLoaded(articles: _articles, hasRearchMax: false));
  }
}
