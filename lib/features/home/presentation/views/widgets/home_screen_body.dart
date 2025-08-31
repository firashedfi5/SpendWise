import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:spendwise/features/home/presentation/views/widgets/home_card.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_header.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> with RouteAware {
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
    log('HomeScreen', name: 'Refreshing');
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomAppBar(),
        HomeCard(),
        TransactionsHeader(),
        TransactionsListView(),
      ],
    );
  }
}
