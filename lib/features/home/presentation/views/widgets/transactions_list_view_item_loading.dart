import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/functions/date_formating.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class TransactionsListViewItemLoading extends StatelessWidget {
  const TransactionsListViewItemLoading({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          children: [
            const Center(child: Icon(Icons.abc)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title ?? '', style: Styles.textStyle18),
                const SizedBox(height: 4),
                Text(
                  formatDate(transaction.date!),
                  style: const TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
            const Spacer(),
            Text(
              transaction.type! == 'Income'
                  ? '+\$${transaction.amount.toString()}'
                  : '-\$${transaction.amount.toString()}',
              style: Styles.textStyle14.copyWith(
                color: transaction.type! == 'Income'
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
