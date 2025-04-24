import 'package:flutter/material.dart';
import 'package:news_app/models/items.dart';
import 'package:news_app/services/category_view.dart';

class HorizontalItems extends StatelessWidget {
  final ItemsModel item;

  const HorizontalItems({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryViewContent(category: item.imageText);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          width: 220,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(item.imageAsset),
            ),
          ),
          child: Center(
              child: Text(
            item.imageText,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
