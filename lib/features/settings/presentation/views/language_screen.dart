import 'package:flutter/material.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/language_screen_body.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language'), centerTitle: true),
      body: const LanguageScreenBody(),
    );
  }
}
