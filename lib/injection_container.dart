import 'package:clean_app/features/events/data/data_sources/remote/event_api_service.dart';
import 'package:clean_app/features/events/data/repository/event_repository_impl.dart';
import 'package:clean_app/features/events/domain/repository/event_repository.dart';
import 'package:clean_app/features/events/domain/usecases/get_event.dart';
import 'package:clean_app/features/events/presentation/bloc/event/remote/remote_event_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<EventsApiService>(EventsApiService(sl()));

  sl.registerSingleton<EventRepository>(EventRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetEventUseCase>(GetEventUseCase(sl()));

  // sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  // sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  // sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteEventsBloc>(() => RemoteEventsBloc(sl()));

  // sl.registerFactory<LocalArticleBloc>(
  //     () => LocalArticleBloc(sl(), sl(), sl()));
}
