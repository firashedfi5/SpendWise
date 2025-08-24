import 'package:flutter/material.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: const LoginScreenBody(),
    );
  }
}
