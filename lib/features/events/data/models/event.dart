import 'package:clean_app/features/events/domain/entities/event.dart';

class EventModel extends EventEntity {
  const EventModel({
    required int id,
    required String title,
  }) : super(
          id: id,
          title: title,
        );

  factory EventModel.fromJson(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      title: map['title'],
    );
  }

  factory EventModel.fromEntity(EventEntity entity) {
    return EventModel(
      id: entity.id,
      title: entity.title,
    );
  }
}
