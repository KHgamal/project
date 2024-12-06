import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/core/colors.dart';
import 'package:rasid_task/features/location/controller/location_provider.dart';
import 'package:rasid_task/features/location/view/views/location_view.dart';
import 'package:rasid_task/features/notification/viewmodel/controller/notification_provider.dart';
import 'package:rasid_task/features/notification/viewmodel/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => NotificationsProvider(),),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notification Demo',
        theme: ThemeData(useMaterial3: false ,scaffoldBackgroundColor: Colors.white ,
         colorScheme: ColorScheme.light(
    primary: AllColors.teal, // Main color for buttons, app bars, etc.
  ),
         primaryColor:AllColors.teal ),
        home: const LocationPage (),
      ),
    );
  }
}