import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../datasources/remote_data_source.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/popular_articles_entity.dart';
import '../../domain/repositories/popular_articles%20_repository.dart';

class PopularArticlesRepositoryImp implements PopularArticlesRepository {
  final RemoteDataSource _remoteDataSource;

  PopularArticlesRepositoryImp(this._remoteDataSource);

  @override
  Future<Either<Failure, PopularArticlesEntity>> getPopularArticles(String section, String period) async {
      try {
        final result = await _remoteDataSource.getPopularArticles(section, period);
        return Right(result as PopularArticlesEntity);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, e.statusCode));
      }

  }
  


}