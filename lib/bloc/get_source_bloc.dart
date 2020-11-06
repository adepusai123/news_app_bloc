import 'package:flutter/cupertino.dart';
import 'package:news_app_bloc/model/source_response.dart';
import 'package:news_app_bloc/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourceBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<SourceResponse> _subject =
      BehaviorSubject<SourceResponse>();

  getSource() async {
    SourceResponse response = await _repository.getSources();
    _subject.sink.add(response);
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
  }

  // BehaviorSubject<GetSourceBloc> get subject => _subject;
}
