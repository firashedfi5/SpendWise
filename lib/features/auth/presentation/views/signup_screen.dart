import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/signup_screen_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(appBar: AppBar(), body: const SignupScreenBody()),
    );
  }
}
