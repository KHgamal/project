import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'location_provider.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocationProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Location and Address'),backgroundColor: const Color.fromARGB(255, 50, 187, 162),
      foregroundColor: Colors.white,),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Lottie.asset('assets/map.json',height: 150),
            const SizedBox(height: 18,),
            // Button to fetch current location
            ElevatedButton(
              style:  ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 50, 187, 162) ,
              foregroundColor: Colors.white),
              onPressed: () => provider.fetchCurrentLocation(context),
              child: const Text('Get Current Location Address'),
            ),
            const Divider(),
            const SizedBox(height: 5,),
            // Latitude/Longitude input
            TextField(
              controller: provider.latController,
              decoration: const InputDecoration(
                labelText: 'Latitude',
                border: OutlineInputBorder(),
              ),
            //  keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: provider.lngController,
              decoration: const InputDecoration(
                labelText: 'Longitude',
                border: OutlineInputBorder(),
              ),
             // keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
              style:  ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 50, 187, 162) ,
              foregroundColor: Colors.white),
              onPressed: () {
                final latitude = double.tryParse(provider.latController.text);
                final longitude = double.tryParse(provider.lngController.text);

                if (latitude != null && longitude != null) {
                  provider.fetchAddressFromLatLng(context, latitude, longitude);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid latitude or longitude')),
                  );
                }
              },
              child: const Text('Get Address from Lat/Lng'),
            ),
            const Divider(),
            const SizedBox(height: 5,),
            // Google Maps link input
           TextField(
              controller: provider.linkController,
              decoration: const InputDecoration(
                labelText: 'Google Maps Link',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
              style:  ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 50, 187, 162) ,
              foregroundColor: Colors.white),
              onPressed: () => provider.fetchAddressFromGoogleMapsLink(context, provider.linkController.text),
              child: const Text('Get Address from Link'),
            ),
            const Divider(),

            // Display the result
            Text(
              provider.address,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold ,),
            ),
          ],
        ),
      ),
    );
  }
}

