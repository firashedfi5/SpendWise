import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spendwise/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings'), centerTitle: true),
        body: const SettingsScreenBody(),
      ),
    );
  }
}
