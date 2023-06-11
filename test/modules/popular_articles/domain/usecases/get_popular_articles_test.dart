import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/entities/article_entity.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/entities/popular_articles_entity.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/repositories/popular_articles%20_repository.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/usecases/get_popular_articles.dart';

import 'get_popular_articles_test.mocks.dart';

@GenerateMocks([PopularArticlesRepository])
void main() {
   late MockPopularArticlesRepository mockPopularArticlesRepository;
   late GetPopularArticles getPopularArticles;

  setUp(() {
    mockPopularArticlesRepository = MockPopularArticlesRepository();
    getPopularArticles = GetPopularArticles(mockPopularArticlesRepository);
  });

  const testSection = "all-sections";
  const testPeriod = "7";
  const testPopularArticlesEntity = PopularArticlesEntity(popularArticles: [ArticleEntity(title: '', publisher: '', publishedDate: '',source: '')]);

  test('use case: should get articles list from repository', () async {
    when(mockPopularArticlesRepository.getPopularArticles(testSection, testPeriod)).thenAnswer((_) async => const Right(testPopularArticlesEntity));

    final result = await getPopularArticles.execute(section: testSection, period: testPeriod);

    expect(result, const Right(testPopularArticlesEntity));
    verify(mockPopularArticlesRepository.getPopularArticles(testSection, testPeriod));
    verifyNoMoreInteractions(mockPopularArticlesRepository);
  });
}