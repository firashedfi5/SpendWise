import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/settings/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/account_info_screen_body.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Account Info'), centerTitle: true),
        body: const AccountInfoScreenBody(),
      ),
    );
  }
}
