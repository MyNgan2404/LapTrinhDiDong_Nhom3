import 'dart:convert';

import 'package:demo/Models/articles.dart';
import 'package:demo/services/art_api.dart';
import 'package:http/http.dart' as http;

class ArticleServices extends ArticleApi {
  @override
  Future<List<Article>> getListArticles(String topic) async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?q=$topic&apiKey=bdede64b51d34b3587ef9953ab02606b'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET,POST,PUT',
          'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
          'Access-Control-Allow-Credentials': 'true',
        },
      );

      int statusCode = response.statusCode;
      if (200 >= statusCode && statusCode <= 299) {
        return jsonDecode(utf8.decode(response.bodyBytes))['articles']
            .cast<Map<String, dynamic>>()
            .map<Article>((e) => Article.fromJson(e))
            .toList();
      }
      if (400 <= statusCode && statusCode <= 499) {
        throw Exception('Lỗi');
      } else if (500 <= response.statusCode && response.statusCode <= 599) {
        throw Exception('Lỗi hệ thống');
      }
      return [];
    } catch (error) {
      throw Exception('Đã có lỗi xảy ra' + error.toString());
    }
  }
}
