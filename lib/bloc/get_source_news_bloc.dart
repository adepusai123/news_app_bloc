import 'package:flutter/cupertino.dart';
import 'package:news_app_bloc/model/article_response.dart';
import 'package:news_app_bloc/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourceNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getSourceNews(String sourceId) async {
    ArticleResponse response = await _repository.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getSourceNewsBloc = GetSourceNewsBloc();
