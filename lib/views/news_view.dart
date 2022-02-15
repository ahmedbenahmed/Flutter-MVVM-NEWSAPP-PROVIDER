import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_mvvm/view-model/news_article_view_model.dart';
import 'package:news_mvvm/view-model/news_view_model.dart';
import 'package:news_mvvm/views/news_view_detail_page.dart';
import 'package:news_mvvm/widgets/home_grid_view.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NewsListViewModel>(context, listen: false).topHeadlines());
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("News MVVM DEMO"),
      ),
      body: SafeArea(
        child: listViewModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (listViewModel.newsError != null
                ? Center(
                    child: Text(
                    listViewModel.newsError.message,
                    textAlign: TextAlign.center,
                  ))
                : HomeGridView(listViewModel)),
      ),
    );
  }
}
