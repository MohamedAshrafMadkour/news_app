import 'package:flutter/material.dart';
import 'package:news_app/models/services_model.dart';
import 'package:news_app/services/news_detail.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel news;

  const NewsTile({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebViewScreen(
            url: news.url,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  news.image ??
                      'https://cdn.pixabay.com/photo/2018/01/04/15/51/404-error-3060993_1280.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? '',
              style: const TextStyle(fontSize: 20),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              news.description ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
