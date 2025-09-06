import 'package:flutter/material.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/account_info_screen_body.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Info'), centerTitle: true),
      body: const AccountInfoScreenBody(),
    );
  }
}
