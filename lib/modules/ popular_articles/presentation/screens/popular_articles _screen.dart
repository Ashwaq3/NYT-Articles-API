import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nyt_articles/modules/%20popular_articles/domain/entities/article_entity.dart';
import '../bloc/popular_articles_cubit.dart';
import '../components/appbar.dart';
import '../components/drawer.dart';
import 'package:nyt_articles/screen_routers.dart';

Color gray = const Color(0xFF999A9A);

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerComponent(),
        appBar: buildAppbar(context, "NY Times Most Popular",
            action: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            )),
        body: BlocBuilder<PopularArticlesCubit, PopularArticlesState>(
            builder: (context, state) {
          if (state is PopularArticlesStateLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF78E1C3),
              ),
            );
          } else if (state is PopularArticlesStateLoaded) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: state.popularArticlesList.popularArticles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routers.articleDetail,
                          arguments:
                              state.popularArticlesList.popularArticles[index]);
                    },
                    child: ArticlesTile(
                        tileItem:
                            state.popularArticlesList.popularArticles[index]),
                  );
                });
          }
          return const SizedBox();
        }));
  }
}

class ArticlesTile extends StatelessWidget {
  final ArticleEntity tileItem;

  const ArticlesTile({
    super.key,
    required this.tileItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: gray,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tileItem.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 4),
                    child: Text(
                      tileItem.publisher.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: gray),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tileItem.source.toUpperCase().toUpperCase(),
                        style: TextStyle(color: gray),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: gray,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            tileItem.publishedDate,
                            style: TextStyle(color: gray),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 22,
            color: gray,
          ),
        ],
      ),
    );
  }
}
