import 'package:flutter/material.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/custom_segmented_buttons.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/income_outcome_header.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/stats_container.dart';

class StatsScreenBody extends StatelessWidget {
  const StatsScreenBody({super.key});

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
        TransactionsListView(),
      ],
    );
  }
}
