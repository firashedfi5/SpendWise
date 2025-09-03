import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/custom_chart_group.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: SizedBox(
        child: MultiBlocListener(
          listeners: [
            BlocListener<DeleteTransactionCubit, DeleteTransactionState>(
              listener: (context, state) {
                if (state is DeleteTransactionSuccess) {
                  context.read<FetchTransactionsCubit>().fetchTransactions();
                }
              },
            ),
          ],
          child: BlocBuilder<FetchTransactionsCubit, FetchTransactionsState>(
            builder: (context, state) {
              double totalIncome = 0;
              double totalExpenses = 0;
              if (state is FetchTransactionsSuccess) {
                totalIncome = context
                    .read<FetchTransactionsCubit>()
                    .getTotalIncome(transactions: state.transactions);
                totalExpenses = context
                    .read<FetchTransactionsCubit>()
                    .getTotalExpenses(transactions: state.transactions);
              }
              return BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      // getTooltipColor: (group) => Colors.lightBlueAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY}',
                          const TextStyle(
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  gridData: const FlGridData(drawVerticalLine: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  maxY: 8000,
                  barGroups: [
                    customBarChart(
                      x: 1,
                      totalExpenses: totalExpenses,
                      totalIncome: totalIncome,
                    ),
                    customBarChart(
                      x: 2,
                      totalExpenses: totalExpenses,
                      totalIncome: totalIncome,
                    ),
                    customBarChart(
                      x: 3,
                      totalExpenses: totalExpenses,
                      totalIncome: totalIncome,
                    ),
                    customBarChart(
                      x: 4,
                      totalExpenses: totalExpenses,
                      totalIncome: totalIncome,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
