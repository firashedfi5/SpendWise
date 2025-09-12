import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view.dart';
import 'package:spendwise/features/stats/presentation/manager/filtering_cubit/filtering_cubit.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class FilteredTransactionsListViewBlocBuilder extends StatelessWidget {
  const FilteredTransactionsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeleteTransactionCubit, DeleteTransactionState>(
          listener: (context, state) {
            if (state is DeleteTransactionSuccess) {
              customSnackBar(
                context: context,
                message: 'Transaction deleted successfully',
                success: true,
              );
              context.read<FilteringCubit>().filterTransactions(
                type: context.read<FilteringCubit>().type,
              );
            } else if (state is DeleteTransactionFailure) {
              customSnackBar(
                context: context,
                message: state.errMessage,
                success: false,
              );
            }
          },
        ),
      ],
      child: BlocBuilder<FetchTransactionsCubit, FetchTransactionsState>(
        builder: (context, state) {
          if (state is FetchTransactionsSuccess) {
            final allTransactions = state.transactions;

            if (allTransactions.isEmpty) {
              return const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text('No Transaction added yet!'),
                    SizedBox(height: 50),
                  ],
                ),
              );
            }

            context.read<FilteringCubit>().setAllTransactions(allTransactions);

            return BlocBuilder<FilteringCubit, FilteringState>(
              builder: (context, state) {
                List<TransactionModel> filteredTransactions = [];

                if (state is FilteringInitial) {
                  filteredTransactions = allTransactions;
                } else if (state is FilteringSuccess) {
                  filteredTransactions = state.filteredTransactions;
                }

                return TransactionsListView(
                  transactions: filteredTransactions
                      .where(
                        (transaction) =>
                            transaction.date!.month == DateTime.now().month,
                      )
                      .toList(),
                  isHome: false,
                );
              },
            );
          }
          return const SliverToBoxAdapter(child: SizedBox());
        },
      ),
    );
  }
}
