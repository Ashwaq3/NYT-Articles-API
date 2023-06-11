import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_articles/core/error/exception.dart';
import 'package:nyt_articles/core/error/failure.dart';
import 'package:nyt_articles/modules/%20popular_articles/data/datasources/remote_data_source.dart';
import 'package:nyt_articles/modules/%20popular_articles/data/model/article_model.dart';
import 'package:nyt_articles/modules/%20popular_articles/data/model/popular_articles_model.dart';
import 'package:nyt_articles/modules/%20popular_articles/data/repositories/popular_articles%20_repository_Imp.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/entities/popular_articles_entity.dart';

import 'popular_articles_repository_imp_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late PopularArticlesRepositoryImp popularArticlesRepositoryImp;
 late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    popularArticlesRepositoryImp =
        PopularArticlesRepositoryImp(mockRemoteDataSource);
  });

  const String testSection = "all-sections";
  const String testPeriod = "7";
  const testPopularArticlesModel = PopularArticlesModel( [ArticleModel('',  '', '','')]);
  const PopularArticlesEntity testPopularArticlesEntity = testPopularArticlesModel;
  test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.getPopularArticles(testSection, testPeriod)).thenAnswer((_) async => testPopularArticlesModel);

        final result = await popularArticlesRepositoryImp.getPopularArticles(testSection, testPeriod);


        verify(mockRemoteDataSource.getPopularArticles(testSection, testPeriod));
        expect(result, equals(const Right(testPopularArticlesEntity)));

      });

  test(
      'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(mockRemoteDataSource.getPopularArticles(testSection, testPeriod)).thenThrow(const ServerException(''));

        final result = await popularArticlesRepositoryImp.getPopularArticles(testSection, testPeriod);


        verify(mockRemoteDataSource.getPopularArticles(testSection, testPeriod));
        expect(result, equals( const Left(ServerFailure('', 404))));

      });
  
}
