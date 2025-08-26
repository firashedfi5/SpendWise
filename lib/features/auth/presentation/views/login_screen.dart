import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spendwise/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:spendwise/features/auth/presentation/views/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: const LoginScreenBody(),
      ),
    );
  }
}
