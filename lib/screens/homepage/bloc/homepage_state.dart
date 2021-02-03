part of 'homepage_cubit.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();
}

class HomePageUninitialized extends HomepageState {
  @override
  List<Object> get props => [];
}

class HomepageLoaded extends HomepageState {
  List<Article> articles;

  HomepageLoaded({this.articles});

  HomepageLoaded copyWith({List<Article> articles, bool hasReachedMax}) {
    return HomepageLoaded(articles: articles ?? this.articles);
  }

  @override
  List<Object> get props => [articles];
}

class HomepageLoading extends HomepageState {
  @override
  List<Object> get props => [];
}

class HomepageError extends HomepageState {
  String errorMessage;

  HomepageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
