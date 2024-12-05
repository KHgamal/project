import 'package:flutter/material.dart';
import 'package:rasid_task/features/notification/models/notification_entity.dart';

import 'package:rasid_task/features/notification/viewmodel/notification_service.dart';

class NotificationsProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  DateTime? selectedDate;
  int? countdownSeconds;
  final notifyFormKey = GlobalKey<FormState>();
  List<NotificationEntity> notifications = [];

  Future<void> fetchNotifications() async {
    final pendingNotifications = await NotificationService.getPendingNotifications();
    notifications = pendingNotifications
        .map((pn) => NotificationEntity(
              id: pn.id,
              title: pn.title!,
              body: pn.body!,
            ))
        .toList();
    notifyListeners();
  }

  Future<void> clearNotification(int id) async {
    await NotificationService.clearNotification(id);
    await fetchNotifications(); 
    notifyListeners();
  }

   Future<void> addNotification() async {
    final title = titleController.text.trim();
    final body = bodyController.text.trim();

    final notification = NotificationEntity(
      id: DateTime.now().second,
      title: title,
      body: body,
      scheduledDate: selectedDate,
    );
    if (notification.scheduledDate == null) {
      // Instant Notification
      await NotificationService.showNotification(notification);
    } else {
      // Scheduled Notification
      await NotificationService.scheduleNotification(notification);
    }
    await fetchNotifications();
    resetFields();
    notifyListeners();
  }

    void startCountdown() {
    if (selectedDate == null) return;
    final now = DateTime.now();
    final secondsToNotification = selectedDate!.difference(now).inSeconds;
      countdownSeconds = secondsToNotification;
    Future.delayed(const Duration(seconds: 1), updateCountdown);
     notifyListeners();
  }

    void updateCountdown() {
  if (countdownSeconds == null || countdownSeconds! <= 0) {
    countdownSeconds = null; // Set to null when the countdown ends
    notifyListeners(); // Notify listeners to update the UI
    return;
  }
  countdownSeconds = countdownSeconds! - 1;
  Future.delayed(const Duration(seconds: 1), updateCountdown);
  notifyListeners();
}

   void pickDate(context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
          selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          startCountdown();
      }
    }
    notifyListeners();
  }

    
    void resetFields() {
    titleController.clear();
    bodyController.clear();
    selectedDate = null;
   // countdownSeconds = null;
  }
}
