
import 'package:flutter/material.dart';
import 'package:news_link/Component/customSourceListTile.dart';
import 'package:news_link/Pages/articles_details_page.dart';
import 'package:news_link/main.dart';
import 'package:news_link/model/article_model.dart';
import 'package:news_link/model/source_model.dart';

Widget customSourceListTile(Source source, BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SourcePage(source:source))
      );
    },
    child: Container(
      margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              source.name ??"",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}