import 'package:demo/Models/articles.dart';

abstract class ArticleApi {
  Future<List<Article>> getListArticles(String topic);
}
