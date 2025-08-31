import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_loading.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: MultiBlocListener(
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
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Dismissible(
                    key: ValueKey(transactions[index].id),
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red.withValues(alpha: 0.15),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context.read<DeleteTransactionCubit>().deleteTransaction(
                        id: transactions[index].id!,
                      );
                      transactions.remove(transactions[index]);
                    },
                    child: GestureDetector(
                      onTap: () => transactions[index].type == 'Income'
                          ? context.push(
                              AppRouter.kAddIncomeScreen,
                              extra: transactions[index],
                            )
                          : context.push(
                              AppRouter.kAddExpenseScreen,
                              extra: transactions[index],
                            ),
                      child: TransactionsListViewItem(
                        transaction: transactions[index],
                      ),
                    ),
                  );
                }, childCount: transactions.length),
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
      ),
    );
  }
}
