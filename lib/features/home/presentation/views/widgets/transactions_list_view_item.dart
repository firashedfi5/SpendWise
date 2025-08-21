import 'package:flutter/material.dart';
import 'package:spendwise/core/enums/income_categories.dart';
import 'package:spendwise/core/utils/styles.dart';

class TransactionsListViewItem extends StatelessWidget {
  const TransactionsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Center(child: IncomeCategories.salary.icon),
          const SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Salary', style: Styles.textStyle18),
              SizedBox(height: 4),
              Text('Today', style: TextStyle(color: Colors.blueGrey)),
            ],
          ),
          const Spacer(),
          Text(
            '+\$1000.00',
            style: Styles.textStyle14.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
