import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';

class TransactionsListViewItem extends StatelessWidget {
  const TransactionsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.local_grocery_store_outlined),
          const SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Grocery Store', style: Styles.textStyle18),
              SizedBox(height: 4),
              Text('Today', style: TextStyle(color: Colors.blueGrey)),
            ],
          ),
          const Spacer(),
          Text(
            '-\$100.00',
            style: Styles.textStyle14.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
