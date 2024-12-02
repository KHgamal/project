import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasid_task/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:rasid_task/features/notification/domain/entities/notification_entity.dart';
import 'package:rasid_task/features/notification/presentation/ui/view/show_notification_view.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  DateTime? _selectedDate;
  int? _countdownSeconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Notification Title:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _titleController,
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
              controller: _bodyController,
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
                    _selectedDate != null
                        ? "Scheduled: ${_selectedDate!.toLocal()}"
                        : "No date selected",
                  ),
                ),
                TextButton(
                  onPressed: _pickDate,
                  child: const Text("Pick Date"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _handleNotification,
                    child: const Text("Trigger Notification"),
                  ),
                ),
                 Expanded(
                   child: ElevatedButton(onPressed: () {
                     
                   },
                 /*   onPressed: ()=> Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const ShowNotificationScreen()),
                     ),*/
                    child: const Text("Go to Notification"),
                                   ),
                 ),
              ],
            ),
            const SizedBox(height: 16),
            if (_countdownSeconds != null)
              Column(
                children: [
                  const Text(
                    "Countdown to Scheduled Notification:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$_countdownSeconds seconds remaining",
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _pickDate() async {
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
        setState(() {
          _selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _startCountdown();
        });
      }
    }
  }

  void _handleNotification() {
    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Title and Body are required!")),
      );
      return;
    }

    final notification = NotificationEntity(
      id: 0,
      title: title,
      body: body,
      scheduledDate: _selectedDate,
    );

    if (_selectedDate == null) {
      // Instant Notification
   NotificationRepositoryImpl. showNotification(notification);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Instant notification triggered!")),
      );
    } else {
      // Scheduled Notification
          NotificationRepositoryImpl .scheduleNotification(notification)
          ;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Notification scheduled!")),
      );
    }

    _resetFields();
  }

  void _resetFields() {
    _titleController.clear();
    _bodyController.clear();
    setState(() {
      _selectedDate = null;
      _countdownSeconds = null;
    });
  }

  void _startCountdown() {
    if (_selectedDate == null) return;

    final now = DateTime.now();
    final secondsToNotification = _selectedDate!.difference(now).inSeconds;

    setState(() {
      _countdownSeconds = secondsToNotification;
    });

    Future.delayed(const Duration(seconds: 1), _updateCountdown);
  }

  void _updateCountdown() {
    if (_countdownSeconds == null || _countdownSeconds! <= 0) return;

    setState(() {
      _countdownSeconds = _countdownSeconds! - 1;
    });

    Future.delayed(const Duration(seconds: 1), _updateCountdown);
  }
}
