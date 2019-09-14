import 'package:flutter/material.dart';
import '../state_management/news_data.dart';
import 'package:provider/provider.dart';
import '../screens/details_page.dart';

class NewsCard extends StatelessWidget {
  final int index;
  NewsCard(this.index);
  @override
  Widget build(BuildContext context) {
    final newsdata = Provider.of<NewsData>(context);
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsPage(index)));
      },
      child: Card(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Text(newsdata.newsModel.articles[index].source.name ??
                      "Source not vailable",style: TextStyle(fontFamily: 'Playfair_Display',
                    fontWeight: FontWeight.w200,),),
                ],
              ),
              Hero(
                  transitionOnUserGestures: true,
                  tag: 'articles_img$index',
                  child:Image.network(newsdata.newsModel.articles[index].urlToImage??"http://axistechindia.com/images/image%20not%20available.jpg",fit:BoxFit.cover,height: MediaQuery.of(context).size.width*0.6,)
              ),
              Text(newsdata.newsModel.articles[index].title ??
                  "Title not available",style: TextStyle(fontFamily: 'Cinzel',
                fontWeight: FontWeight.w700,),),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      newsdata.newsModel.articles[index].author??
                          "Author not available",maxLines: 1,style: TextStyle(fontFamily: 'Playfair_Display',
                      fontWeight: FontWeight.w200,),
                    ),
                  ),
                  Text(
                    newsdata.newsModel.articles[index].publishedAt
                        .toString()
                        .substring(0, 10) ??
                        "Publish data not available",style: TextStyle(fontFamily: 'Playfair_Display',
                    fontWeight: FontWeight.w200,),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
