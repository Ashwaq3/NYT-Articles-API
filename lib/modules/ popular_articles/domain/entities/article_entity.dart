import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String title;
  final String publisher;
  final String publishedDate;
  final String source;

  const ArticleEntity({
    required this.title,
    required this.publisher,
    required this.publishedDate,
    required this.source
  });

  @override
  List<Object> get props => [title, publisher, publishedDate, source];
}
