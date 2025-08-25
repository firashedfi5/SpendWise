import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/core/widgets/custom_text_form_field.dart';
import 'package:spendwise/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/password_form_field.dart';

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
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          customSnackBar(
            context: context,
            errMessage: state.errMessage,
            success: false,
          );
        }
        if (state is SignupSuccess) {
          customSnackBar(
            context: context,
            errMessage: 'Account created successfully',
            success: true,
          );
          GoRouter.of(context).push(AppRouter.kMainScreen);
        }
      },
      child: Form(
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
            PasswordFormField(
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
                context.read<SignupCubit>().signup(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
