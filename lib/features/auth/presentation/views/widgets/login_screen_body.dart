import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/login_form.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/login_signup_with_google.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Log in',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome back! Please enter your details.',
              style: Styles.textStyle16,
            ),

            const SizedBox(height: 20),
            LoginForm(
              emailController: emailController,
              passwordController: passwordController,
            ),

            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: Styles.textStyle16,
                ),
                const SizedBox(width: 4),
                TextButton(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  onPressed: () =>
                      GoRouter.of(context).push(AppRouter.kSignupScreen),
                  child: const Text('Sign up'),
                ),
              ],
            ),

            const SizedBox(height: 4),
            const LoginSignupWithGoogle(isLogin: true),
          ],
        ),
      ),
    );
  }
}
