import 'package:flutter/material.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/theme_screen_body.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme'), centerTitle: true),
      body: const ThemeScreenBody(),
    );
  }
}
