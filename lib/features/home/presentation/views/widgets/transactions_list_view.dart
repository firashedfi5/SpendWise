import 'package:flutter/material.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const TransactionsListViewItem();
        }, childCount: 4),
      ),
    );
  }
}
