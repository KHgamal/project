import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*

class ShowNotificationScreen extends StatelessWidget {
  const ShowNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body:
             Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    final notification = state.pendingNotifications[index];
                    return ListTile(
                      title: Text(notification.title!),
                      subtitle: Text(notification.body!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<NotificationBloc>()
                              .add(ClearNotification(notification.id));
                        },
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<NotificationBloc>().add(const ClearAllNotifications());
                  },
                  child: const Text("Clear All"),
                )
              ],
            ));
          }     
}
*/