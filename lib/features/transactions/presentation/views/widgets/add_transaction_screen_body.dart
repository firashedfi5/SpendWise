import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_bloc_builder.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_transactions_buttons.dart';

class AddTransactionScreenBody extends StatefulWidget {
  const AddTransactionScreenBody({super.key});

  @override
  State<AddTransactionScreenBody> createState() =>
      _AddTransactionScreenBodyState();
}

class _AddTransactionScreenBodyState extends State<AddTransactionScreenBody>
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
    log('AddTransactionScreen', name: 'Refreshing');
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(title: Text('Add'), centerTitle: true),
        AddTransactionButtons(),
        SliverPadding(
          padding: EdgeInsets.all(kPadding24),
          sliver: SliverToBoxAdapter(
            child: Text('Last Added', style: Styles.textStyle18),
          ),
        ),
        TransactionListViewBlocBuilder(),
      ],
    );
  }
}
