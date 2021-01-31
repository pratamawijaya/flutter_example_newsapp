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

  HomepageLoaded(this.articles);

  @override
  List<Object> get props => [articles];

}