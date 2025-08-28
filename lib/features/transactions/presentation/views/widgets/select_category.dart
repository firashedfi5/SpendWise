import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/category_selector.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Category', style: Styles.textStyle18),
        const SizedBox(height: 8),
        Row(
          children: [
            BlocBuilder<TransactionsCubit, TransactionsState>(
              builder: (context, state) {
                String? category;
                if (state is CategoryUpdated) {
                  category = state.category;
                }
                return Chip(label: Text(category ?? 'Select category'));
              },
            ),
            IconButton(
              onPressed: () async {
                final cubit = context.read<TransactionsCubit>();

                await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: CategorySelector(isIncome: isIncome),
                  ),
                );
              },
              icon: const Icon(Icons.add, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}
