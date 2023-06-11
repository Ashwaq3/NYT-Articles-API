
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nyt_articles/modules/%20popular_articles/data/model/article_model.dart';
import 'package:nyt_articles/modules/%20popular_articles/data/model/popular_articles_model.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/entities/popular_articles_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testPopularArticlesModel = PopularArticlesModel([ArticleModel(
    "How to Clear 500,000 Feral Cats From New York’s Streets",
    "By Richard Schiffman and Erin Schaff",
    "2023-06-08",
    "New York Times",
  )]);

  test('should be a subclass of PopularArticlesModel entity', () async {
    expect(testPopularArticlesModel, isA<PopularArticlesEntity>());
  });

  test(
    'should return a valid model',
        () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('popular_articles.json'));

      final result = PopularArticlesModel.fromJson(jsonMap);

      expect(result, testPopularArticlesModel);
    },
  );
}