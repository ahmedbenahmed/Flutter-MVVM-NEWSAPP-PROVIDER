import 'package:flutter/material.dart';
import 'package:news_mvvm/view-model/news_view_model.dart';
import 'package:news_mvvm/views/news_view_detail_page.dart';

import 'home_cached_network_image.dart';

class HomeGridView extends StatelessWidget {
  final NewsListViewModel listViewModel;

  const HomeGridView(this.listViewModel);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var data = listViewModel.articles[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewsDetailScreen(
                article: data,
              );
            }));
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: HomeCachedNetworkImage(data),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: listViewModel.articles.length,
    );
  }
}
