import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

LinearGradient cardGradient() {
  return const LinearGradient(
    colors: [kTertiaryColor, kPrimaryColor, kSecondaryColor],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
