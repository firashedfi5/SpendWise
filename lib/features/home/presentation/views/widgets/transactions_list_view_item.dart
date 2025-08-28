import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class TransactionsListViewItem extends StatelessWidget {
  const TransactionsListViewItem({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        children: [
          Center(
            child: context.read<HomeCubit>().getCategoryIcon(
              type: transaction.type!,
              fetchedCategory: transaction.category!,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.title ?? '', style: Styles.textStyle18),
              const SizedBox(height: 4),
              Text(
                transaction.date!.toIso8601String(),
                style: const TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
          const Spacer(),
          Text(
            transaction.amount! > 0
                ? '+${transaction.amount.toString()}'
                : transaction.amount.toString(),
            style: Styles.textStyle14.copyWith(
              color: transaction.amount! > 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
