import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_parser.dart';
import 'modules/%20popular_articles/data/datasources/remote_data_source.dart';
import 'modules/%20popular_articles/data/repositories/popular_articles%20_repository_Imp.dart';
import 'modules/%20popular_articles/domain/repositories/popular_articles%20_repository.dart';
import 'modules/%20popular_articles/domain/usecases/get_popular_articles.dart';
import 'modules/%20popular_articles/presentation/bloc/popular_articles_cubit.dart';

final serviceLocator = GetIt.instance;

void init() {
  ///Bloc
  serviceLocator.registerFactory(() => PopularArticlesCubit(
        getPopularArticles: serviceLocator(),
      ));

  ///Use cases
  serviceLocator.registerLazySingleton(() => GetPopularArticles(
        serviceLocator(),
      ));

  ///Repository
  serviceLocator.registerLazySingleton<PopularArticlesRepository>(
      () => PopularArticlesRepositoryImp(
            serviceLocator(),
          ));

  ///Data Source
  serviceLocator
      .registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(
            client: serviceLocator(),
            networkParser: serviceLocator(),
          ));

  ///Core
  serviceLocator.registerLazySingleton<NetworkParser>(() => NetworkParserImp());

  ///External
  serviceLocator.registerLazySingleton(() => Dio());
}
