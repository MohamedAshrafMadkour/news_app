import 'package:flutter/material.dart';
import 'package:news_app/components/news_scroll.dart';
import 'package:news_app/models/services_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:dio/dio.dart';

class NewsScrollBuilder extends StatefulWidget {
  final String category;
  const NewsScrollBuilder({
    super.key,
    required this.category,
  });

  @override
  State<NewsScrollBuilder> createState() => _NewsScrollBuilderState();
}

class _NewsScrollBuilderState extends State<NewsScrollBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsScroll(article: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Text('oops there are some errors');
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
            );
          }
        });
  }
}
