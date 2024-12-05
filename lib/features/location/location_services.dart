import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static Future<bool> handleLocationPermission(context) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

 static Future<Position?> getCurrentLocation(context) async {
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return null;

    try {
        return await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high, // Specify accuracy level here
      distanceFilter: 10, // Optional: Notify only after moving 10 meters
    ),
  );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching location: $e')),
      );
      return null;
    }
  }

 static Future<Position> getLocationFromLatLng(
      double latitude, double longitude) async {
    return Position(
      latitude: latitude,
      longitude: longitude,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
  }

 static Future<Position?> getLocationFromGoogleMapsLink(context, String link) async {
    final Uri uri = Uri.parse(link);
    final lat =
        double.tryParse(uri.queryParameters['q']?.split(',').first ?? '');
    final lng =
        double.tryParse(uri.queryParameters['q']?.split(',').last ?? '');

    if (lat == null || lng == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Google Maps link')),
      );
      return null;
    }

    return Position(
      latitude: lat,
      longitude: lng,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
  }

 static  Future<String?> getAddressFromCoordinates(context, Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      // first screenshot
      return '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to resolve address: $e')),
      );
      return null;
    }
  }
}
