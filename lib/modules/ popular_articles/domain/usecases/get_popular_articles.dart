import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/popular_articles_entity.dart';
import '../repositories/popular_articles%20_repository.dart';

class GetPopularArticles {
  final PopularArticlesRepository popularArticlesRepository;

  GetPopularArticles(this.popularArticlesRepository);

  Future<Either<Failure, PopularArticlesEntity>> execute(
      {required String section, required String period}) async {
    return await popularArticlesRepository.getPopularArticles(section, period);
  }
}
