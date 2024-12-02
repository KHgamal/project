import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/features/notification/viewmodel/controller/notification_provider.dart';
import 'package:rasid_task/features/notification/view/screens/show_notification_view.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Notification Title:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: notificationProvider. titleController,
                decoration: const InputDecoration(
                  hintText: "Enter title",
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Notification Body:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller:notificationProvider.bodyController,
                decoration: const InputDecoration(
                  hintText: "Enter body",
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Schedule Notification:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      notificationProvider.selectedDate != null
                          ? "Scheduled: ${notificationProvider.selectedDate !.toLocal()}"
                          : " No date selected",
                    ),
                  ),
                  TextButton(
                    onPressed:()=>notificationProvider .pickDate(context),
                    child: const Text("Pick Date"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: notificationProvider.addNotification,
                      child: const Text("Trigger Notification"),
                    ),
                  ),
                  const SizedBox(width: 8),
                   Expanded(
                     child: ElevatedButton( onPressed: ()=> Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const ShowNotificationScreen()),
                       ),
                      child: const Text("Go to Notification"),
                                     ),
                   ),
                ],
              ),
              const SizedBox(height: 30),
              if (notificationProvider.countdownSeconds != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Countdown to Scheduled Notification:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${notificationProvider.countdownSeconds} seconds remaining",
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

}
