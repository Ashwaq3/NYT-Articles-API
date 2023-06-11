import 'package:flutter/material.dart';

import 'modules/%20popular_articles/domain/entities/article_entity.dart';
import 'modules/%20popular_articles/presentation/screens/article_details%20_screen.dart';
import 'modules/%20popular_articles/presentation/screens/popular_articles%20_screen.dart';

class Routers {
  static const String articleDetail = '/articleDetail';
  static const String popularArticles = '/popularArticles';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.popularArticles:
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  const ArticlesScreen());

      case Routers.articleDetail:
        var data =settings.arguments as ArticleEntity;
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  ArticleDetails(article: data,));

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text(
                    'No route defined for ${settings.name}'
                ),
              ),
            ));
    }
  }
}