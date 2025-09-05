import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/core/utils/styles.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(AssetsData.defaultAvatar),
          radius: 75,
        ),
        const SizedBox(height: 10),
        Text(
          getIt.get<FirebaseAuth>().currentUser!.displayName ?? 'Unkown',
          style: Styles.textStyle22,
        ),
        Text(getIt.get<FirebaseAuth>().currentUser!.email ?? ''),
      ],
    );
  }
}
