import 'package:flutter/material.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/forgot_password_screen_body.dart';

class ForgotPasswrodScreen extends StatelessWidget {
  const ForgotPasswrodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const ForgotPasswordScreenBody());
  }
}
