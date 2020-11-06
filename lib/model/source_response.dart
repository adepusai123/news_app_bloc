import 'package:news_app_bloc/model/source.dart';

class SourceResponse {
  SourceResponse({this.status, this.sources, this.error});

  String status;
  List<SourceModel> sources;
  String error;

  factory SourceResponse.fromJson(Map<String, dynamic> json) => SourceResponse(
        status: json["status"],
        error: '',
        sources: List<SourceModel>.from(
            json["sources"].map((x) => SourceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
      };

  SourceResponse.withError(String errorValue)
      : sources = List(),
        error = errorValue;
}
