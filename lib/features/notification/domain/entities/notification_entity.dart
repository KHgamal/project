class NotificationEntity {
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
}
