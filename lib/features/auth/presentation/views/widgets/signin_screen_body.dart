import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/signin_main_section.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/signin_with_google.dart';

class SigninScreenBody extends StatefulWidget {
  const SigninScreenBody({super.key});

  @override
  State<SigninScreenBody> createState() => _SigninScreenBodyState();
}

class _SigninScreenBodyState extends State<SigninScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding24),
        child: Form(
          child: Column(
            children: [
              const Image(
                image: AssetImage(AssetsData.loginIllustration),
                width: 280,
              ),
              SigninMainSection(
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to SpendWise?', style: Styles.textStyle16),
                  const SizedBox(width: 4),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                    ),
                    onPressed: () {},
                    child: const Text('Sign up'),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const SigninWithGoogle(),
            ],
          ),
        ),
      ),
    );
  }
}
