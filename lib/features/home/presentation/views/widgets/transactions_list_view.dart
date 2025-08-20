import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({super.key, required this.childCount});

  final int childCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const TransactionsListViewItem();
        }, childCount: childCount),
      ),
    );
  }
}
