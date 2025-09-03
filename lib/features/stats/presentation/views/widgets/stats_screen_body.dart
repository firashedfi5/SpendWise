import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/features/stats/presentation/manager/filtering_cubit/filtering_cubit.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/custom_segmented_buttons.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/filtered_transactions_list_view_bloc_builder.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/income_outcome_header.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/stats_container.dart';

class StatsScreenBody extends StatefulWidget {
  const StatsScreenBody({super.key});

  @override
  State<StatsScreenBody> createState() => _StatsScreenBodyState();
}

class _StatsScreenBodyState extends State<StatsScreenBody> with RouteAware {
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
    context.read<FilteringCubit>().filterTransactions(
      type: context.read<FilteringCubit>().type,
    );
    log('StatsScreen', name: 'Refreshing');
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Overview'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        IncomeOutcomeHeader(),
        StatsContainer(),
        CustomSegmentedButton(),
        FilteredTransactionsListViewBlocBuilder(),
      ],
    );
  }
}
