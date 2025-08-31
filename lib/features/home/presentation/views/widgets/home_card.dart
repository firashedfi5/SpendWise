import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/functions/card_gradient.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<FetchTransactionsCubit, FetchTransactionsState>(
          builder: (context, state) {
            double totalBalance = 0;
            double totalIncome = 0;
            double totalExpenses = 0;
            if (state is FetchTransactionsSuccess) {
              final transactions = state.transactions;
              totalBalance = context
                  .read<FetchTransactionsCubit>()
                  .getTotalBalance(transactions: transactions);
              totalIncome = context
                  .read<FetchTransactionsCubit>()
                  .getTotalIncome(transactions: transactions);
              totalExpenses = context
                  .read<FetchTransactionsCubit>()
                  .getTotalExpenses(transactions: transactions);
            }
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius24),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.255,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius24),
                  gradient: cardGradient(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding24),
                  child: Column(
                    children: [
                      Text(
                        'Total Balance',
                        style: Styles.textStyle16.copyWith(color: Colors.white),
                      ),
                      Text(
                        '\$ ${totalBalance.toString()}',
                        style: Styles.textStyle50.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_circle_down_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Income',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '\$ ${totalIncome.toString()}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_circle_up_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Expenses',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '\$ ${totalExpenses.toString()}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
