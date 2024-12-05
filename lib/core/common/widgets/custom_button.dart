import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    this.onPressed,
    required this.text,
  });
  final Color color;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, foregroundColor: Colors.white),
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}