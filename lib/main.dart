import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injector.dart';
import 'modules/%20popular_articles/presentation/bloc/popular_articles_cubit.dart';
import 'screen_routers.dart';
import 'dependency_injector.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => serviceLocator<PopularArticlesCubit>()..getPopularArticles("all-sections", "7"),
        child: MaterialApp(
            onGenerateRoute: Routers.generateRoute,
            initialRoute: Routers.popularArticles,
          debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return child!;
            }));
  }
}

