import 'package:clean_app/features/events/domain/entities/event.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

abstract class RemoteEventsState extends Equatable {
  final List<EventEntity>? events;
  final DioException? error;

  const RemoteEventsState({this.events, this.error});

  @override
  List<Object> get props => [events!, error!];
}

class RemoteEventsLoading extends RemoteEventsState {
  const RemoteEventsLoading();
}

class RemoteEventsDone extends RemoteEventsState {
  const RemoteEventsDone(List<EventEntity> event) : super(events: event);
}

class RemoteEventsError extends RemoteEventsState {
  const RemoteEventsError(DioException error) : super(error: error);
}
