import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
//import 'package:rasid_task/core/di/injection.dart';
//import 'package:rasid_task/features/notification/data/data_sources/local_data_source/notification_service.dart';
import 'package:rasid_task/features/notification/data/repositories/notification_repository_impl.dart';
//import 'package:rasid_task/features/notification/presentation/controller/notification/notification_bloc.dart';
import 'package:rasid_task/features/notification/presentation/ui/view/notification_view.dart';
import 'package:timezone/data/latest_all.dart' as tz;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationRepositoryImpl.initialize();
   tz.initializeTimeZones();
 // await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Demo',
      home: NotificationScreen(),
    );
  }
}

// @injectable for usecases
// @Injectable(as: BaseRepository) for repository implementation in data
// @injectable for bloc
// @singleton in inject file for dio / services / other