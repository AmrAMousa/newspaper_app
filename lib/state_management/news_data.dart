
import 'package:flutter/material.dart';

import '../models/news_models.dart';


class NewsData extends ChangeNotifier{
  NewsModel _newsModel = NewsModel();

  NewsModel get newsModel => _newsModel;

  set newsModel(NewsModel newsModel) {
    _newsModel = newsModel;
    notifyListeners();
  }

}