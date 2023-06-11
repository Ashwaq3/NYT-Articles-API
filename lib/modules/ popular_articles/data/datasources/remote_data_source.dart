import 'package:dio/dio.dart';

import '../../../../core/network/network_parser.dart';
import '../../../../core/remote_urls.dart';
import '../../../%20popular_articles/data/model/popular_articles_model.dart';

abstract class RemoteDataSource {
  Future<PopularArticlesModel> getPopularArticles(
      String section, String period);
}


class RemoteDataSourceImp implements RemoteDataSource {
  final Dio client;
  final NetworkParser networkParser;

  RemoteDataSourceImp({required this.client, required this.networkParser});

  @override
  Future<PopularArticlesModel> getPopularArticles(
      String section, String period) async {
    final uri = RemoteUrls.getMostPopularAPI(section, period);

    final clientMethod = client.get(
      uri,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    final response =
        await networkParser.callClientWithCatchException(() => clientMethod);

    return PopularArticlesModel.fromJson(response);
  }
}
