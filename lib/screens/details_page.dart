import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../state_management/news_data.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailsPage extends StatelessWidget {
  final int index;
  DetailsPage(this.index);
  @override
  Widget build(BuildContext context) {
    final newsdata = Provider.of<NewsData>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Hero(
                tag: 'articles_img$index',
                child: Image.network(
                  newsdata.newsModel.articles[index].urlToImage ??
                      "http://axistechindia.com/images/image%20not%20available.jpg",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  newsdata.newsModel.articles[index].title ?? " ",
                  style: TextStyle(
                      fontFamily: 'Cinzel',
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0),
                ),
              ),
              InkWell(
                onTap: ()=>_launchURL(newsdata.newsModel.articles[index].url),
                child: Text(
                  newsdata.newsModel.articles[index].source.name,
                  style: TextStyle(
                      fontFamily: 'Cinzel',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        newsdata.newsModel.articles[index].author ??
                            "Author not available",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Playfair_Display',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Text(
                      newsdata.newsModel.articles[index].publishedAt
                              .toString()
                              .substring(0, 10) ??
                          "Publish data not available",
                      style: TextStyle(
                        fontFamily: 'Playfair_Display',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
                  Text(newsdata.newsModel.articles[index].content,style: TextStyle(
                    fontFamily: 'Playfair_Display',
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                  ),)
            ]),
          ],
        ),
      ),
    );
  }
}


_launchURL(String mUrl) async {
  final url = mUrl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}