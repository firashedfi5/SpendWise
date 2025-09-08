import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/all_transactions_list_view.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/all_transactions_list_view_loading.dart';

class AllTransactionsScreenBody extends StatelessWidget {
  const AllTransactionsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FetchTransactionsCubit, FetchTransactionsState>(
          listener: (context, state) {
            if (state is FetchTransactionsFailure) {
              customSnackBar(
                context: context,
                message: state.errMessage,
                success: false,
              );
            }
          },
        ),
        BlocListener<DeleteTransactionCubit, DeleteTransactionState>(
          listener: (context, state) {
            if (state is DeleteTransactionSuccess) {
              customSnackBar(
                context: context,
                message: 'Transaction deleted successfully',
                success: true,
              );
              context.read<FetchTransactionsCubit>().fetchTransactions();
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
            final transactions = state.transactions;
            if (transactions.isEmpty) {
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
            return AllTransactionListView(transactions: transactions);
          } else if (state is FetchTransactionsFailure) {
            return const Column(
              children: [
                SizedBox(height: 50),
                Icon(Icons.error_outline, color: Colors.red),
                SizedBox(height: 50),
              ],
            );
          } else if (state is FetchTransactionsLoading) {
            return const AllTransactionsListViewLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
