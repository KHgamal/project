import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/features/notification/viewmodel/controller/notification_provider.dart';
import 'package:rasid_task/features/notification/viewmodel/notification_service.dart';


class ShowNotificationScreen extends StatelessWidget {
  const ShowNotificationScreen({super.key});

   @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: FutureBuilder(
        future: notificationProvider.fetchNotifications(),
        builder: (context, snapshot) {
          final notifications = notificationProvider.notifications;

          if (notifications.isEmpty) {
            return const Center(child: Text('No Notifications'));
          }

          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return ListTile(
                    title: Text(notification.title ),
                    subtitle: Text(notification.body),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await notificationProvider.clearNotification(notification.id);
                      },
                    ),
                  );
                },
              ),
                ElevatedButton(
                    onPressed: ()async {
                    await NotificationService.clearAllNotifications();
                    },
                    child: const Text("Clear All"),
                  )
            ],
          );
        },
      ),
    );
  }
}
