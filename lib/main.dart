import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_link/Component/customListTile.dart';
import 'package:news_link/Component/sourceTab.dart';
import 'package:news_link/model/source_model.dart';
import 'package:news_link/search/SearchNews.dart';
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
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchUser());
                },
                icon: const Icon(Icons.search_sharp),
              )
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.source)),
                Tab(
                  icon: Icon(Icons.article),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [ListWidget(client: client), SourceTab(client: client)],
          ),
        ),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  final ApiService client;
  const ListWidget({Key? key, required this.client}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        //   log(snapshot.data.toString());
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  customListTile(articles![index], context));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class SourceTab extends StatefulWidget {
  final ApiService client;
  const SourceTab({Key? key, required this.client}) : super(key: key);

  @override
  _SourceTabState createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.client.getArticleSource(),
      builder: (BuildContext context, AsyncSnapshot<List<Source>> snapshot) {
        //   log(snapshot.data.toString());
        if (snapshot.hasData) {
          List<Source>? articles = snapshot.data;
          return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  customSourceListTile(articles![index], context));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
