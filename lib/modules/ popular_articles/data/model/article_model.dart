import '../../../%20popular_articles/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel(
    String title,
    String publisher,
    String publishedDate,
      String source,
  ) : super(title: title, publisher: publisher, publishedDate: publishedDate, source: source);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(json["title"],
        json["byline"],
        json["published_date"],
    json["source"]);
  }
}
