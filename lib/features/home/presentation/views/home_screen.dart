import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/home/data/repos/home_repo_impl.dart';
import 'package:spendwise/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())
        ..getTransactions(userId: getIt.get<FirebaseAuth>().currentUser!.uid),
      child: const Scaffold(body: HomeScreenBody()),
    );
  }
}
