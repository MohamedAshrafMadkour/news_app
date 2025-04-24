import 'package:flutter/material.dart';
import 'package:news_app/components/category_listview.dart';
import 'package:news_app/components/news_scroll_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'News',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                'Cloud',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              NewsScrollBuilder(
                category: 'general',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
