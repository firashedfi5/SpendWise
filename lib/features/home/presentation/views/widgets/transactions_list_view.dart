import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/features/home/presentation/manager/delete_transaction/delete_transaction_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({
    super.key,
    required this.transactions,
    required this.isHome,
  });

  final List<TransactionModel> transactions;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Dismissible(
            key: ValueKey(transactions[index].id),
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red.withValues(alpha: 0.15),
              child: const Icon(Icons.delete, color: Colors.red, size: 30),
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
              child: TransactionsListViewItem(transaction: transactions[index]),
            ),
          );
        }, childCount: isHome == true ? 4 : transactions.length),
      ),
    );
  }
}
