import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/settings_buttons.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/settings_header.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kPadding24),
      child: Center(
        child: Column(
          children: [SettingsHeader(), SizedBox(height: 30), SettingsButtons()],
        ),
      ),
    );
  }
}
