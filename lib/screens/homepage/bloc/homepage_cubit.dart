import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_newsapp_example/data/repository/article_repository.dart';
import 'package:flutter_newsapp_example/domain/article.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  ArticleRepository _articleRepository;

  HomepageCubit(this._articleRepository) : super(HomepageInitial());

  void getTopHeadlines(String category, String country) async {
    emit(HomepageLoading());

    final result = await _articleRepository.getTopHeadlines(country, category);

    result.map((value) => log("result -> ${value.url}"));

    emit(HomepageLoaded(result));
  }
}
