import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/core/colors.dart';
import 'package:rasid_task/core/common/widgets/custom_button.dart';
import 'package:rasid_task/core/common/widgets/text_field.dart';
import 'package:rasid_task/features/location/controller/location_provider.dart';

class LocationFromURL extends StatelessWidget {
  const LocationFromURL({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocationProvider>();
    return Form(
      key: provider.urlFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: provider.linkController,
            labelText: "Google Maps Link",
          ),
          const SizedBox(
            height: 8,
          ),
          CustomButton(
            color: AllColors.teal,
            text: 'Get Address from Link',
            onPressed: () {
              if (provider.urlFormKey.currentState!.validate()) {
                provider.fetchAddressFromGoogleMapsLink(
                    context, provider.linkController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}