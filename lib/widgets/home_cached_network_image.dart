import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_mvvm/view-model/news_article_view_model.dart';

class HomeCachedNetworkImage extends StatelessWidget {
  final NewsArticleViewModel data;

  const HomeCachedNetworkImage(this.data);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: data.imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Icon(Icons.error),
        );
      },
    );
  }
}
