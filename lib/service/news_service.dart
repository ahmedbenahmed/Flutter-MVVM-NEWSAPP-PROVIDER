import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_mvvm/model/news_error_model.dart';
import 'package:news_mvvm/model/news_model.dart';
import 'package:news_mvvm/utils/utils.dart';

import 'api_status.dart';

class NewsService {
  Future<Object> fetchTopHeadlines() async {
    try {
      final response = await http.get(Uri.parse(TOP_HEADLINES + API_KEY));

      if (response.statusCode == SUCCESS) {
        final result = jsonDecode(response.body);
        if (result["status"] == "ok") {
          Iterable list = result['articles'];
          var newsArticleList =
              list.map((article) => NewsArticle.fromJson(article)).toList();
          return Success(response: newsArticleList);
        } else {
          return Failure(errorResponse: NewsError.fromJson(result).message);
        }
      } else {
        final result = jsonDecode(response.body);
        return Failure(errorResponse: NewsError.fromJson(result).message);
      }
    } on HttpException {
      return Failure(errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(errorResponse: 'Unknown Error');
    }
  }
}
