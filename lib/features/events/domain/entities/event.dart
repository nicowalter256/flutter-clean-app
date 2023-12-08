import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int id;
  final String title;

  const EventEntity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
    ];
  }
}
