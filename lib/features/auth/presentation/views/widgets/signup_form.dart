import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/custom_text_form_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            textController: nameController,
            label: 'Name',
            hintText: 'Enter your name',
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 35),
          CustomElevatedButton(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            label: 'Sign up',
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kMainScreen);
              log(nameController.text);
              log(emailController.text);
              log(passwordController.text);
            },
          ),
        ],
      ),
    );
  }
}
