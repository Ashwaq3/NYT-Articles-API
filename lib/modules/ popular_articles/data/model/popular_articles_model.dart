import 'article_model.dart';
import '../../../%20popular_articles/domain/entities/popular_articles_entity.dart';

class PopularArticlesModel extends PopularArticlesEntity{

  const PopularArticlesModel(List<ArticleModel> popularArticles) : super(popularArticles: popularArticles);

 factory PopularArticlesModel.fromJson(Map<String, dynamic> json) {
    return PopularArticlesModel(List<ArticleModel>.from(
      (json['results'] as List<dynamic>).map<ArticleModel>(
            (article) => ArticleModel.fromJson(article as Map<String, dynamic>),
      ),
    ));
  }


}
