import 'package:equatable/equatable.dart';

import 'article_entity.dart';

class PopularArticlesEntity extends Equatable {
  final List<ArticleEntity> popularArticles;

  const PopularArticlesEntity({
    required this.popularArticles,
  });

  @override
  List<Object> get props => [popularArticles];
}
