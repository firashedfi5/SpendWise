import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spendwise/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:spendwise/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/signup_screen_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: Scaffold(appBar: AppBar(), body: const SignupScreenBody()),
    );
  }
}
