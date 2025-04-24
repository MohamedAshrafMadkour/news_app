import 'package:flutter/material.dart';
import 'package:news_app/components/news_scroll_builder.dart';

class CategoryViewContent extends StatelessWidget {
  const CategoryViewContent({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsScrollBuilder(
            category: category,
          ),
        ],
      ),
    );
  }
}
