import 'dart:io';

import 'package:clean_app/core/resources/data_state.dart';
import 'package:clean_app/features/events/data/data_sources/remote/event_api_service.dart';
import 'package:clean_app/features/events/data/models/event.dart';
import 'package:clean_app/features/events/domain/repository/event_repository.dart';
import 'package:dio/dio.dart';

class EventRepositoryImpl implements EventRepository {
  final EventsApiService _eventsApiService;
  EventRepositoryImpl(this._eventsApiService);

  @override
  Future<DataState<List<EventModel>>> getEvents() async {
    try {
      final httpResponse = await _eventsApiService.getEvents();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // @override
  // Future<List<ArticleModel>> getSavedArticles() async {
  //   return _appDatabase.articleDAO.getArticles();
  // }

  // @override
  // Future<void> removeArticle(ArticleEntity article) {
  //   return _appDatabase.articleDAO
  //       .deleteArticle(ArticleModel.fromEntity(article));
  // }

  // @override
  // Future<void> saveArticle(ArticleEntity article) {
  //   return _appDatabase.articleDAO
  //       .insertArticle(ArticleModel.fromEntity(article));
  // }
}
