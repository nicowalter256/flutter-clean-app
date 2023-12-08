import 'package:clean_app/core/resources/data_state.dart';
import 'package:clean_app/features/events/domain/entities/event.dart';

abstract class EventRepository {
  // API methods
  Future<DataState<List<EventEntity>>> getEvents();

  // Database methods
  // Future<List<ArticleEntity>> getSavedArticles();

  // Future<void> saveArticle(ArticleEntity article);

  // Future<void> removeArticle(ArticleEntity article);
}
