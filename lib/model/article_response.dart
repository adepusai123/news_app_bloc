import 'package:news_app_bloc/model/article.dart';

class ArticleResponse {
  ArticleResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.error,
  });

  String status;
  int totalResults;
  List<ArticleModel> articles;
  String error;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        error: '',
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleModel>.from(
            json["articles"].map((x) => ArticleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };

  ArticleResponse.withError(String errorValue)
      : articles = List(),
        error = errorValue;
}

// class ArticleResponse {
//   final List<ArticleModel> articles;
//   final String error;

//   ArticleResponse(this.articles, this.error);

//   ArticleResponse.fromJson(Map<String, dynamic> json)
//       : articles = (json["articles"] as List)
//             .map((i) => new ArticleModel.fromJson(i))
//             .toList(),
//         error = "";

//   ArticleResponse.withError(String errorValue)
//       : articles = List(),
//         error = errorValue;
// }
