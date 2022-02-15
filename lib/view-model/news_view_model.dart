import 'dart:html';

import 'package:flutter/material.dart';
import 'package:news_mvvm/model/news_error_model.dart';
import 'package:news_mvvm/model/news_model.dart';
import 'package:news_mvvm/service/api_status.dart';
import 'package:news_mvvm/service/news_service.dart';
import 'package:news_mvvm/view-model/news_article_view_model.dart';

class NewsListViewModel with ChangeNotifier {
  List<NewsArticleViewModel> articles =
      List<NewsArticleViewModel>.empty(growable: true);
  NewsError newsError;
  bool isLoading = false;

  Future<void> topHeadlines() async {
    isLoading = true;
    notifyListeners();
    var response = await NewsService().fetchTopHeadlines();
    if (response is Success) {
      this.articles = ((response as Success).response as List<NewsArticle>)
          .map((article) => NewsArticleViewModel(article: article))
          .toList();
    }
    if (response is Failure) {
      newsError = NewsError(
        message: response.errorResponse,
      );
    }
    isLoading = false;
    notifyListeners();
  }
}
