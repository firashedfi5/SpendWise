import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';
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
            FilterChip(label: const Text('Salary'), onSelected: (value) {}),
            const SizedBox(width: 8),
            FilterChip(label: const Text('Discount'), onSelected: (value) {}),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => CategorySelector(isIncome: isIncome),
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
