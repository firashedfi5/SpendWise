import 'package:flutter/material.dart';

LinearGradient cardGradient() {
  return const LinearGradient(
    colors: [Colors.blueAccent, Colors.purpleAccent, Colors.orangeAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
