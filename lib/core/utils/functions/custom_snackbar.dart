import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String message,
  required bool success,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: success == true ? Colors.green : Colors.red,
    ),
  );
}
