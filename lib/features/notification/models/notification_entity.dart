import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int id;
  final String title;
  final String body;
  final DateTime? scheduledDate;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    this.scheduledDate,
  });
  
  @override
  List<Object?> get props => [id , title , body , scheduledDate];
}
