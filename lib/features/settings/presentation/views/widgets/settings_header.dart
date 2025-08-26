import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/styles.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(AssetsData.defaultAvatar),
          radius: 85,
        ),
        SizedBox(height: 10),
        Text('Dina Hedfi', style: Styles.textStyle22),
        Text('dinahedfi4@gmail.com'),
      ],
    );
  }
}
