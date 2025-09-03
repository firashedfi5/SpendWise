import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/stats_header_container.dart';

class IncomeOutcomeHeader extends StatelessWidget {
  const IncomeOutcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<FetchTransactionsCubit, FetchTransactionsState>(
          builder: (context, state) {
            double totalIncome = 0;
            double totalExpenses = 0;
            if (state is FetchTransactionsSuccess) {
              final transactions = state.transactions;
              totalIncome = context
                  .read<FetchTransactionsCubit>()
                  .getTotalIncome(transactions: transactions);
              totalExpenses = context
                  .read<FetchTransactionsCubit>()
                  .getTotalExpenses(transactions: transactions);
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatsHeaderContainer(
                  color: kPrimaryColor,
                  amount: totalIncome,
                  text: 'Total Income',
                  icon: const Icon(
                    Icons.arrow_circle_down,
                    color: kPrimaryColor,
                  ),
                ),
                StatsHeaderContainer(
                  color: kSecondaryColor,
                  amount: totalExpenses,
                  text: 'Total Expenses',
                  icon: const Icon(
                    Icons.arrow_circle_up,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
