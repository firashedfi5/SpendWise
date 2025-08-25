import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/core/widgets/custom_text_form_field.dart';
import 'package:spendwise/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/password_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouter.kMainScreen);
        }
      },
      child: Form(
        child: Column(
          children: [
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
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                onPressed: () =>
                    GoRouter.of(context).push(AppRouter.kForgotPasswordScreen),
                child: const Text('Forgot Password'),
              ),
            ),
            const SizedBox(height: 6),
            CustomElevatedButton(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              label: 'Log in',
              onPressed: () {
                context.read<LoginCubit>().login(
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
