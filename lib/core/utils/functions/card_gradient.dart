import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

LinearGradient cardGradient() {
  return const LinearGradient(
    colors: [
      kPrimaryGradientColor,
      kSecondaryGradientColor,
      kTeriaryGradientColor,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
