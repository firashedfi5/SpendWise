import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_loading.dart';
import 'package:spendwise/features/stats/presentation/manager/filtering_cubit/filtering_cubit.dart';

class FilteredTransactionsListViewBlocBuilder extends StatelessWidget {
  const FilteredTransactionsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FilteringCubit, FilteringState>(
          listener: (context, state) {
            if (state is FilteringFailure) {
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
      child: BlocBuilder<FilteringCubit, FilteringState>(
        builder: (context, state) {
          if (state is FilteringSuccess) {
            final transactions = state.filteredTransactions;
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
            return TransactionsListView(transactions: transactions);
          } else if (state is FilteringFailure) {
            return const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(height: 50),
                ],
              ),
            );
          } else if (state is FilteringLoading) {
            return const TransactionsListViewLoading();
          }
          return const SliverToBoxAdapter(child: SizedBox());
        },
      ),
    );
  }
}
