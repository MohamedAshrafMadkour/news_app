import 'package:flutter/material.dart';
import 'package:news_app/components/category.dart';
import 'package:news_app/models/items.dart';

class CategoriesListView extends StatelessWidget {
  final List<ItemsModel> item = const [
    ItemsModel(imageAsset: 'assets/business image.jpg', imageText: 'Business'),
    ItemsModel(
        imageAsset: 'assets/amusement-park-4392606_1920.jpg',
        imageText: 'Entertainment'),
    ItemsModel(
        imageAsset: 'assets/Free Global Health Care .jpg', imageText: 'Health'),
    ItemsModel(imageAsset: 'assets/science.avif', imageText: 'Science'),
    ItemsModel(imageAsset: 'assets/sports.jpg', imageText: 'Sports'),
    ItemsModel(imageAsset: 'assets/technology.jpeg', imageText: 'Technology'),
  ];

  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HorizontalItems(item: item[index]);
        },
      ),
    );
  }
}
