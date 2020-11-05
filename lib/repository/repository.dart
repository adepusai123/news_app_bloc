import 'package:dio/dio.dart';
import 'package:news_app_bloc/model/article_response.dart';
import 'package:news_app_bloc/model/source_response.dart';

class NewsRepository {
  static String mainUrl = "http://newsapi.org/v2/";
  final String apiKey = "96f62a28927f44e69bea383b027ba5ca";

  final Dio _dio = Dio();

  var getSourceUrl = "$mainUrl/sources";
  var getTopHeadlineUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async {
    var params = {"apiKey": apiKey, "language": "en", "country": "us"};

    try {
      Response response = await _dio.get(getSourceUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stacktrace: $stacktrace");
      return SourceResponse.withError(error);
    }
  }

  Future<ArticleResponse> getTopHeadLines() async {
    var params = {"apiKey": apiKey, "country": "us"};
    try {
      Response response =
          await _dio.get(getTopHeadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stacktrace: $stackTrace");
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getHotNews() async {
    var params = {"apiKey": apiKey, "q": "apple", "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stacktrace: $stackTrace");
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {"apiKey": apiKey, "sources": sourceId};

    try {
      Response response =
          await _dio.get(getTopHeadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stacktrace: $stackTrace");
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> search(String searchValue) async {
    var params = {"apiKey": apiKey, "q": searchValue};

    try {
      Response response =
          await _dio.get(getTopHeadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stacktrace: $stackTrace");
      return ArticleResponse.withError(error);
    }
  }
}
