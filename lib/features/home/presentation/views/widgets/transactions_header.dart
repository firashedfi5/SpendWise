import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';

class TransactionsHeader extends StatelessWidget {
  const TransactionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
            ),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
      ),
    );
  }
}
