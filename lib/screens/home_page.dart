import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import '../models/news_models.dart';
import '../state_management/news_data.dart';
import 'package:provider/provider.dart';
import '../news_widgets/news_card.dart';



class HomePage extends StatefulWidget {

  final searchKey;
  final Color color;
  HomePage(this.searchKey, this.color);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final newsdata = Provider.of<NewsData>(context);
    newsdata.newsModel=null;
    return Scaffold(

      body:  Container(
        color: widget.color,
        child: FutureBuilder<NewsModel>(
          future: fetchData(widget.searchKey),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              newsdata.newsModel = snapshot.data;
              return ListView.builder(
                itemCount: newsdata.newsModel.articles.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: NewsCard(index),
                ),
              );
            }else if(snapshot.hasError){
              print(snapshot.error);
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
Future<NewsModel> fetchData(searchKey) async {
  final response = await http.get(
      'https://newsapi.org/v2/everything?q=$searchKey&sortBy=publishedAt&apiKey=APIkey');

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body);
    NewsModel newsModel = NewsModel.fromJson(parsed);
    return newsModel;
  } else {
    throw Exception('Failed to load post');
  }
}
