import 'package:flutter/material.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/signup_screen_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const SignupScreenBody());
  }
}
