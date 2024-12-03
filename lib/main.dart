import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/features/notification/viewmodel/controller/notification_provider.dart';
//import 'package:rasid_task/core/di/injection.dart';
//import 'package:rasid_task/features/notification/data/data_sources/local_data_source/notification_service.dart';
import 'package:rasid_task/features/notification/viewmodel/notification_service.dart';
//import 'package:rasid_task/features/notification/presentation/controller/notification/notification_bloc.dart';
import 'package:rasid_task/features/notification/view/screens/notification_view.dart';
import 'package:rasid_task/features/pdf/home_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  tz.initializeTimeZones();
  // await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
        create: (context) => NotificationsProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notification Demo',
        home: HomeScreen(),
      ),
    );
  }
}

// @injectable for usecases
// @Injectable(as: BaseRepository) for repository implementation in data
// @injectable for bloc
// @singleton in inject file for dio / services / other

// Pending Notifications means the scheduled that has not been sended yet
// so when we add notification we should pass diff id or it will just save one 
// we can canel one of the pending (by id) -> mean it will not be sened 
// or can cancel all of them ->  means nothing will be sended

// Use the printing package for full flutter print and share operation.
// printing package's PdfGoogleFonts