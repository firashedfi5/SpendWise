import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/home/data/repos/home_repo_impl.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchTransactionsCubit(getIt.get<HomeRepoImpl>())
                ..fetchTransactions(),
        ),
        BlocProvider(
          create: (context) =>
              DeleteTransactionCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: const Scaffold(body: SafeArea(child: HomeScreenBody())),
    );
  }
}
