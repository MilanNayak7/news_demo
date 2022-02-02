import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_link/model/article_model.dart';
import 'package:flutter/foundation.dart';

class ApiService {

  final client = http.Client();
  final endPoint = "https://newsapi.org/v2/everything?q=tesla&from=2022-01-01&sortBy=publishedAt&apiKey=d5a82e8ff0064231bd6500ba039c7289";
  Future<List<Article>> getArticle() async {

    final response = await client.get(Uri.parse(endPoint));
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;

  }
}