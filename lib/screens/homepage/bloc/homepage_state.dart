part of 'homepage_cubit.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();
}

class HomepageInitial extends HomepageState {
  @override
  List<Object> get props => [];
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

class HomepageLoaded extends HomepageState {
  List<Article> articles;
  bool hasRearchMax;

  HomepageLoaded({this.articles, this.hasRearchMax});

  HomepageLoaded copyWith({List<Article> articles, bool hasReachedMax}) {
    return HomepageLoaded(
        articles: articles ?? this.articles,
        hasRearchMax: hasRearchMax ?? this.hasRearchMax);
  }

  @override
  List<Object> get props => [articles];
}
