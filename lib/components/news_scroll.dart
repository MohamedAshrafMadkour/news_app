import 'package:flutter/material.dart';
import 'package:news_app/components/categories_news.dart';
import 'package:news_app/models/services_model.dart';

class NewsScroll extends StatelessWidget {
  final List<ArticleModel> article;
  const NewsScroll({
    super.key,
    required this.article,
  });
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: article.length,
        (context, index) {
          return NewsTile(news: article[index]);
        },
      ),
    );
  }
}
