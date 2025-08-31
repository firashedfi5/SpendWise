import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_loading.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {
          if (state is HomeFailure) {
            customSnackBar(
              context: context,
              message: state.errMessage,
              success: false,
            );
          } else if (state is DeletingSuccess) {
            customSnackBar(
              context: context,
              message: 'Transaction deleted successfully!',
              success: true,
            );
          }
        },
        builder: (context, state) {
          List<TransactionModel> transactions = context
              .read<HomeCubit>()
              .transactionsList;
          if (state is HomeSuccess) {
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
                    context.read<HomeCubit>().deleteTransaction(
                      id: transactions[index].id!,
                    );
                    context.read<HomeCubit>().transactionsList.remove(
                      transactions[index],
                    );
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
          } else if (state is HomeFailure) {
            return const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(height: 50),
                ],
              ),
            );
          } else if (state is HomeLoading) {
            return const TransactionsListViewLoading();
          }
          return const SliverToBoxAdapter(child: SizedBox());
        },
      ),
    );
  }
}
