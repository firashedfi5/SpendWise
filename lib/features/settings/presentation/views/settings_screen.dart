import 'package:flutter/material.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: const SettingsScreenBody(),
    );
  }
}
