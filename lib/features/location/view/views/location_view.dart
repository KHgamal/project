import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/features/location/view/widgets/current_location.dart';
import 'package:rasid_task/features/location/view/widgets/lat_lng_location.dart';
import 'package:rasid_task/features/location/view/widgets/url_location.dart';
import 'package:rasid_task/features/notification/view/screens/notification_view.dart';

import '../../controller/location_provider.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location and Address'),
        actions: [
          IconButton(onPressed: ()=>Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const NotificationScreen()),
                       ), icon: const Icon(Icons.notification_add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const CurrentLocation(),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // Latitude/Longitude input
            const LocationFromCoordinates(),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // Google Maps link input
            const LocationFromURL(),
            const Divider(),
            // Display the result
            Text(
              provider.address,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}