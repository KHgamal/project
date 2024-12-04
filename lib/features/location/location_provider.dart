import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rasid_task/features/location/location_services.dart';


class LocationProvider extends ChangeNotifier {
      final latController = TextEditingController();
    final lngController = TextEditingController();
    final linkController = TextEditingController();
  String address = "";

  Future<void> fetchCurrentLocation( context) async {
    try {
      Position? position = await LocationService.getCurrentLocation(context);
      if (position == null) {
        address = 'Unable to fetch location';
      } else {
        address = await LocationService.getAddressFromCoordinates(context, position) ?? "Address not found";
      }
    } catch (e) {
      address = "Error: $e";
    }
    notifyListeners();
  }

  Future<void> fetchAddressFromLatLng( context, double latitude, double longitude) async {
    try {
      final position = await LocationService.getLocationFromLatLng(latitude, longitude);
      address = await LocationService.getAddressFromCoordinates(context, position) ?? "Address not found";
    } catch (e) {
      address = "Error: $e";
    }
    notifyListeners();
  }

  Future<void> fetchAddressFromGoogleMapsLink(BuildContext context, String link) async {
    try {
      final position = await LocationService.getLocationFromGoogleMapsLink(context, link);
      if (position == null) {
        address = "Invalid Google Maps link";
      } else {
        address = await LocationService.getAddressFromCoordinates(context, position) ?? "Address not found";
      }
    } catch (e) {
      address = "Error: $e";
    }
    notifyListeners();
  }
}
