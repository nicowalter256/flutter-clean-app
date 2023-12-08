import 'package:clean_app/core/resources/data_state.dart';
import 'package:clean_app/core/usecases/usecase.dart';
import 'package:clean_app/features/events/domain/entities/event.dart';
import 'package:clean_app/features/events/domain/repository/event_repository.dart';

class GetEventUseCase implements UseCase<DataState<List<EventEntity>>, void> {
  final EventRepository _eventRepository;

  GetEventUseCase(this._eventRepository);

  @override
  Future<DataState<List<EventEntity>>> call({void params}) {
    return _eventRepository.getEvents();
  }
}
