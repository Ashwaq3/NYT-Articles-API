import 'package:dartz/dartz.dart';

import '../entities/popular_articles_entity.dart';
import '../../../../core/error/failure.dart';

abstract class PopularArticlesRepository {
  Future<Either<Failure, PopularArticlesEntity>> getPopularArticles(String section, String period);
}
