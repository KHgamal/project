import '../models/notification_entity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

//@Injectable(as: NotificationRepository)
class NotificationService {
   static final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

    static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(android: androidSettings);
    await localNotificationsPlugin.initialize(initializationSettings ,  onDidReceiveNotificationResponse:
      (details) {
        if (details.input != null) {} //details contains information about the notification interaction, and details.input would contain any input (like text) associated with the notification if applicable.
      },);
  }

  static Future<void> showNotification(NotificationEntity notification) async {
    const details =  NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
        channelDescription: 'channel description',
      ),
    );
    print("Showing notification...");
    await localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      details,
    );
  }

 static Future<void> scheduleNotification(NotificationEntity notification) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
    await localNotificationsPlugin.zonedSchedule(
      notification.id,
      notification.title,
      notification.body,
      tz.TZDateTime.from(notification.scheduledDate!, tz.local),
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime, androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  static Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await localNotificationsPlugin.pendingNotificationRequests();
  }

 static Future<void> clearNotification(int id) async {
    await localNotificationsPlugin.cancel(id);
  }

 static Future<void> clearAllNotifications() async {
    await localNotificationsPlugin.cancelAll();
  }
}
