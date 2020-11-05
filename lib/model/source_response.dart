import 'package:news_app_bloc/model/article_response.dart';

class SourceResponse {
  SourceResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  String error;
  List<ArticleResponse> articles;

  factory SourceResponse.fromJson(Map<String, dynamic> json) => SourceResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleResponse>.from(
            json["articles"].map((x) => ArticleResponse.fromJson(x))),
      );

  SourceResponse.withError(String errorValue)
      : articles = List(),
        error = errorValue;
}
