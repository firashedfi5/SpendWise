import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/login_signup_with_google.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/signup_form.dart';

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  final TextEditingController nameController = TextEditingController();
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
            const Text('Create an account', style: Styles.textStyle28),
            const SizedBox(height: 8),
            const Text(
              'Welcome! Please enter your details.',
              style: Styles.textStyle16,
            ),

            const SizedBox(height: 20),
            SignupForm(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
            ),

            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: Styles.textStyle16,
                ),
                const SizedBox(width: 4),
                TextButton(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  onPressed: () => GoRouter.of(context).push('/'),
                  child: const Text('Log in'),
                ),
              ],
            ),

            const SizedBox(height: 4),
            const LoginSignupWithGoogle(isLogin: false),
          ],
        ),
      ),
    );
  }
}
