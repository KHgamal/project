import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/core/colors.dart';
import 'package:rasid_task/core/common/widgets/custom_button.dart';
import 'package:rasid_task/core/common/widgets/text_field.dart';
import 'package:rasid_task/features/location/controller/location_provider.dart';

class LocationFromCoordinates extends StatelessWidget {
  const LocationFromCoordinates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocationProvider>();
    return Form(
      key: provider.latLngFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: provider.latController,
            labelText: "Latitude",
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: provider.lngController,
            labelText: "Longitude",
          ),
          const SizedBox(
            height: 8,
          ),
          CustomButton(
            color: AllColors.teal,
            text: 'Get Address from Lat/Lng',
            onPressed: () {
              if (provider.latLngFormKey.currentState!.validate()) {
                final latitude = double.tryParse(provider.latController.text);
                final longitude = double.tryParse(provider.lngController.text);
                provider.fetchAddressFromLatLng(context, latitude!, longitude!);
              }
            },
          ),
        ],
      ),
    );
  }
}