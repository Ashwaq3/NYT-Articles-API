import 'package:flutter/material.dart';

import '../../domain/entities/article_entity.dart';
import 'popular_articles%20_screen.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleEntity article;

  const ArticleDetails({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: gray,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              margin: const EdgeInsets.only(bottom: 16),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                article.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.publisher,
                style: TextStyle(color: gray),
              ),
            ),

            ///SO on ...
          ],
        ),
      ),
    );
  }
}
