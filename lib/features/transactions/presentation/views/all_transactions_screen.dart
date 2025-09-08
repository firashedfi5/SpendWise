import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/home/data/repos/home_repo_impl.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/all_transactions_screen_body.dart';

class AllTransactionsScreen extends StatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  State<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends State<AllTransactionsScreen>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //* Subscribe to RouteObserver
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    //* Unsubscribe from RouteObserver
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    //* Refresh the transactions list when returning to this screen
    context.read<FetchTransactionsCubit>().fetchTransactions();
    log('AllTransactionScreen', name: 'Refreshing');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteTransactionCubit(getIt.get<HomeRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Transactions'),
          centerTitle: true,
        ),
        body: const SafeArea(child: AllTransactionsScreenBody()),
      ),
    );
  }
}
