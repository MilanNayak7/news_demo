
import 'package:flutter/material.dart';
import 'package:news_link/service/api_service.dart';
import "dart:io";

import 'model/article_model.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("News App", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot){
          if(snapshot.hasData){
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context,index) => ListTile(title: Text(articles![index].title),),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}