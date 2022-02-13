import 'package:news_mvvm/model/news_model.dart';

class NewsArticleViewModel {
  NewsArticle _news;

  NewsArticleViewModel({NewsArticle article}) : _news = article;

  String get title {
    return _news.title;
  }

  String get description {
    return _news.description;
  }

  String get imageUrl {
    return _news.urlToImage;
  }

  String get url {
    return _news.url;
  }

  String get author {
    return _news.author;
  }

  String get publishedAt {
    return _news.publishedAt;
  }

  String get content {
    return _news.content;
  }
}
