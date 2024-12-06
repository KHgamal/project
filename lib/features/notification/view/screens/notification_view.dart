import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/core/colors.dart';
import 'package:rasid_task/core/common/widgets/custom_button.dart';
import 'package:rasid_task/core/common/widgets/text_field.dart';
import 'package:rasid_task/features/notification/viewmodel/controller/notification_provider.dart';
import 'package:rasid_task/features/notification/view/screens/show_notification_view.dart';
import 'package:rasid_task/features/pdf/view/screens/pdf_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider =
        Provider.of<NotificationsProvider>(context, listen: false);
    return Consumer<NotificationsProvider>(
      builder: (context, state ,_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Local Notifications"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: notificationProvider.notifyFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Notification Title:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                        controller: notificationProvider.titleController,
                        labelText: "Enter title"),
                    const SizedBox(height: 16),
                    const Text(
                      "Notification Body:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                        controller: notificationProvider.bodyController,
                        labelText: "Enter body"),
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
                                ? "Scheduled: ${notificationProvider.selectedDate!.toLocal()}"
                                : " No date selected",
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                             if(notificationProvider.notifyFormKey.currentState!.validate()) {
                               notificationProvider.pickDate(context);
                             }
                          },
                             
                          child: const Text("Pick Date"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            color: AllColors.teal,
                            text: "Trigger Notification",
                            onPressed: () {
                              if (notificationProvider
                                  .notifyFormKey.currentState!
                                  .validate()) {
                                notificationProvider.addNotification();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CustomButton(
                            color: AllColors.teal,
                            text: "Go to Notification",
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShowNotificationScreen()),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (notificationProvider.countdownSeconds != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "Countdown to Scheduled Notification:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${notificationProvider.countdownSeconds} seconds remaining",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    Center(
                      child: CustomButton(
                        color: AllColors.teal,
                        text: "PDF Generator",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PDFScreen()),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
