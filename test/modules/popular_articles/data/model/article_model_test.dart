import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nyt_articles/modules/%20popular_articles/data/model/article_model.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/entities/article_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testArticleModel = ArticleModel(
    "How to Clear 500,000 Feral Cats From New York’s Streets",
    "By Richard Schiffman and Erin Schaff",
    "2023-06-08",
    "New York Times",
  );

  test('should be a subclass of Article entity', () async {
    expect(testArticleModel, isA<ArticleEntity>());
  });

  test(
    'should return a valid model',
    () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('article.json'));

      final result = ArticleModel.fromJson(jsonMap);

      expect(result, testArticleModel);
    },
  );
}
