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

  HomepageCubit(this._articleRepository) : super(HomePageUninitialized());

  void getTopHeadlines() async {
    emit(HomepageLoading());

    if (state is HomePageUninitialized) {
    } else {
      _currentPage = _currentPage + 1;
      d.log('log me', name: "loadmore $_currentPage");
    }

    var result = await _articleRepository.getTopHeadlines(
        country, category, _currentPage);
    _articles.addAll(result);

    d.log('log me', name: "panjang data article -> ${_articles.length}");

    emit(HomepageLoaded(articles: _articles));
  }
}
