import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nyt_articles/modules/%20popular_articles/domain/entities/popular_articles_entity.dart';
import 'package:nyt_articles/modules/%20popular_articles/domain/usecases/get_popular_articles.dart';

part 'popular_articles_state.dart';

class PopularArticlesCubit extends Cubit<PopularArticlesState> {
  final GetPopularArticles _getPopularArticles;

  PopularArticlesCubit({
    required GetPopularArticles getPopularArticles,
  })  : _getPopularArticles = getPopularArticles,
        super(const PopularArticlesStateInitial());

  PopularArticlesEntity? popularArticles;

  void getPopularArticles(String section, String period) async {
    emit(const PopularArticlesStateLoading());

    final result =
        await _getPopularArticles.execute(section: section, period: period);
    result.fold(
      (failure) {
        emit(PopularArticlesStateError(failure.message, failure.statusCode));
      },
      (data) {
        popularArticles = data;
        emit(PopularArticlesStateLoaded(data));
      },
    );
  }
}
