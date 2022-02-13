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
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<NewsListViewModel>(context, listen: false)
          .topHeadlines()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("News MVVM DEMO"),
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (listViewModel.newsError != null
                ? Center(child: Text(listViewModel.newsError.message))
                : HomeGridView(listViewModel)),
      ),
    );
  }
}
