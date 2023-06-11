part of 'popular_articles_cubit.dart';

abstract class PopularArticlesState extends Equatable {
  const PopularArticlesState();

  @override
  List<Object> get props => [];
}

class PopularArticlesStateInitial extends PopularArticlesState {
  const PopularArticlesStateInitial();
}

class PopularArticlesStateLoading extends PopularArticlesState {
  const PopularArticlesStateLoading();
}

class PopularArticlesStateError extends PopularArticlesState {
  const PopularArticlesStateError(this.message, this.statusCode);
  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

class PopularArticlesStateLoaded extends PopularArticlesState {
  final PopularArticlesEntity popularArticlesList;
  const PopularArticlesStateLoaded(this.popularArticlesList);

  @override
  List<Object> get props => [popularArticlesList];
}


