import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.label,
    required this.onPressed,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        fixedSize: Size(MediaQuery.of(context).size.width, 45),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
