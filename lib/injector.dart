import 'package:dio/dio.dart';
import 'package:flutter_newsapp_example/data/datasource/article_remote_datasource.dart';
import 'package:flutter_newsapp_example/data/mapper/article_mapper.dart';
import 'package:flutter_newsapp_example/data/repository/article_repository.dart';
import 'package:flutter_newsapp_example/data/service/news_api.dart';
import 'package:flutter_newsapp_example/screens/homepage/bloc/homepage_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // dio
  sl.registerLazySingleton(() => Dio());

  // service
  sl.registerLazySingleton(() => NewsApi(sl()));

  // datasource
  sl.registerLazySingleton<ArticleRemoteDatasource>(
      () => ArticleRemoteDataSourceImpl(api: sl()));

  // mapper
  sl.registerLazySingleton(() => ArticleMapper());

  // repository
  sl.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(
      articleMapper: sl(), articleRemoteDatasource: sl()));

  // cubit
  sl.registerFactory(() => HomepageCubit(sl()));
}
