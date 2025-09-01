import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item_loading.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class TransactionsListViewLoading extends StatelessWidget {
  const TransactionsListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Skeletonizer(
          enabled: true,
          enableSwitchAnimation: true,
          effect: ShimmerEffect(
            duration: const Duration(milliseconds: 1000),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[100]!,
          ),
          child: TransactionsListViewItemLoading(
            transaction: TransactionModel(
              id: 1,
              title: 'Some text',
              category: 'Some text',
              amount: 200,
              date: DateTime.now(),
              type: 'Income',
              userId: 'qsldkjfqljskdf',
            ),
          ),
        );
      }, childCount: 3),
    );
  }
}
