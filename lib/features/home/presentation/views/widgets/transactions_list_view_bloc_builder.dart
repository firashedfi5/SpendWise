import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_loading.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class TransactionListViewBlocBuilder extends StatelessWidget {
  const TransactionListViewBlocBuilder({
    super.key,
    required this.isHome,
    required this.isLastAdded,
  });

  final bool isHome;
  final bool isLastAdded;

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

            //* Sorting
            List<TransactionModel> sortedTransactions;
            if (isLastAdded == true) {
              sortedTransactions = [...transactions]
                ..sort((a, b) {
                  final aDate = a.createdAt ?? DateTime(0);
                  final bDate = b.createdAt ?? DateTime(0);
                  return bDate.compareTo(aDate); //* Descending
                });
            } else {
              sortedTransactions = transactions;
            }

            return TransactionsListView(
              transactions: sortedTransactions,
              isHome: isHome,
            );
          } else if (state is FetchTransactionsFailure) {
            return const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(height: 50),
                ],
              ),
            );
          } else if (state is FetchTransactionsLoading) {
            return const TransactionsListViewLoading();
          }
          return const SliverToBoxAdapter(child: SizedBox());
        },
      ),
    );
  }
}
