import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/core/widgets/custom_text_form_field.dart';

class ForgotPasswordScreenBody extends StatefulWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  State<ForgotPasswordScreenBody> createState() =>
      _ForgotPasswordScreenBodyState();
}

class _ForgotPasswordScreenBodyState extends State<ForgotPasswordScreenBody> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Forgot password', style: Styles.textStyle28),
            const SizedBox(height: 8),
            const Text(
              'Enter your email to receive a reset link.',
              style: Styles.textStyle16,
            ),

            const SizedBox(height: 20),
            Form(
              child: Column(
                children: [
                  CustomTextFormField(
                    textController: emailController,
                    label: 'Email',
                    hintText: 'Enter your email',
                  ),
                  const SizedBox(height: 35),
                  CustomElevatedButton(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    label: 'Reset Password',
                    onPressed: () {
                      GoRouter.of(context).push('/');
                      log(emailController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
