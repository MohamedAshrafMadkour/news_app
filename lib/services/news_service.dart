import 'package:dio/dio.dart';
import 'package:news_app/models/services_model.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=d4ea8586d3bc48469d92917230db8d94&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        ArticleModel articles = ArticleModel.fromJson(article);
        articleList.add(articles);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
