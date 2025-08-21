import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/custom_text_form_field.dart';

class SigninMainSection extends StatelessWidget {
  const SigninMainSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          textController: emailController,
          label: 'Email',
          hintText: 'Enter your email',
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          textController: passwordController,
          label: 'Password',
          hintText: 'Enter your password',
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            onPressed: () {},
            child: const Text('Forgot Password'),
          ),
        ),
        const SizedBox(height: 6),
        CustomElevatedButton(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          label: 'Sign in',
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kMainScreen);
            log(emailController.text);
            log(passwordController.text);
          },
        ),
      ],
    );
  }
}
