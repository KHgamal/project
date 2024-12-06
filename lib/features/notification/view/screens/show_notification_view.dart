import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/features/notification/viewmodel/controller/notification_provider.dart';
import 'package:rasid_task/features/notification/viewmodel/notification_service.dart';

class ShowNotificationScreen extends StatelessWidget {
  const ShowNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider =
        Provider.of<NotificationsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Consumer<NotificationsProvider>(
        
      builder: (context, state ,_) {
          return FutureBuilder(
            future: notificationProvider.fetchNotifications(),
            builder: (context, snapshot) {
              final notifications = notificationProvider.notifications;

              if (notifications.isEmpty) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/images/no.json"),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "No pending Notification",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 19, 35, 128),
                            fontSize: 20),
                      ),
                    ],
                  ),
                );
              }

              return ListView(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          title: Text(notification.title),
                          subtitle: Text(notification.body),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              await notificationProvider
                                  .clearNotification(notification.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await NotificationService.clearAllNotifications(context);
                      },
                      child: const Text("Clear All"),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
