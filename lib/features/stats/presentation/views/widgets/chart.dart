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
              List<Map<String, double>> stats = [];
              if (state is FetchTransactionsSuccess) {
                stats = context.read<FetchTransactionsCubit>().getWeeklyStats(
                  transactions: state.transactions,
                );
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
                            color: Colors.white,
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
                  // maxY: 8000,
                  barGroups: stats.asMap().entries.map((entry) {
                    final index = entry.key;
                    final data = entry.value;
                    return customBarChart(
                      x: index + 1,
                      totalExpenses: data['Expense'] ?? 0,
                      totalIncome: data['Income'] ?? 0,
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
