import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_newsapp_example/data/repository/article_repository.dart';
import 'package:flutter_newsapp_example/domain/article.dart';
import 'dart:developer' as developer;

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  ArticleRepository _articleRepository;
  int _currentPage = 1;
  final String category = "technology";
  final String country = "us";

  HomepageCubit(this._articleRepository) : super(HomepageInitial());

  void loadMore() async {
    _currentPage = _currentPage + 1;

    final result = await _articleRepository.getTopHeadlines(
        country, category, _currentPage);

    developer.log('log me', name: 'articles -> ' + result[0].title);

    emit(HomepageLoaded(articles: result, hasRearchMax: false));
  }

  void getTopHeadlines() async {
    emit(HomepageLoading());

    final result = await _articleRepository.getTopHeadlines(
        country, category, _currentPage);

    developer.log('log me', name: 'articles -> ' + result[0].title);

    emit(HomepageLoaded(articles: result, hasRearchMax: false));
  }
}
