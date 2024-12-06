import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rasid_task/core/colors.dart';
import 'package:rasid_task/core/common/widgets/custom_button.dart';
import 'package:rasid_task/features/location/controller/location_provider.dart';
class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocationProvider>();
    return Column(
      children: [
        Lottie.asset('assets/images/map.json', height: 150),
        const SizedBox(
          height: 18,
        ),
        // Button to fetch current location
        CustomButton(
            color: AllColors.teal,
            text: "Get Current Location Address",
            onPressed: () => provider.fetchCurrentLocation(context)),
      ],
    );
  }
}