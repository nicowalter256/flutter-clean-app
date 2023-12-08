import 'package:clean_app/core/resources/data_state.dart';
import 'package:clean_app/features/events/domain/usecases/get_event.dart';
import 'package:clean_app/features/events/presentation/bloc/event/remote/remote_event_event.dart';
import 'package:clean_app/features/events/presentation/bloc/event/remote/remote_event_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteEventsBloc extends Bloc<RemoteEventsEvent, RemoteEventsState> {
  final GetEventUseCase _getEventUseCase;

  RemoteEventsBloc(this._getEventUseCase) : super(const RemoteEventsLoading()) {
    on<GetEvents>(onGetEvents);
  }

  void onGetEvents(GetEvents event, Emitter<RemoteEventsState> emit) async {
    final dataState = await _getEventUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteEventsDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteEventsError(dataState.error!));
    }
  }
}
