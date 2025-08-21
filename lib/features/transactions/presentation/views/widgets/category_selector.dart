import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/enums/expense_categories.dart';
import 'package:spendwise/core/enums/income_categories.dart';
import 'package:spendwise/core/utils/styles.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Select Category', style: Styles.textStyle18),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final incomeCategory = IncomeCategories.values[index];
                  final expenseCategory = ExpenseCategories.values[index];

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: isIncome == true
                                ? kPrimaryColor.withValues(alpha: 0.1)
                                : kSecondaryColor.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: isIncome == true
                                ? incomeCategory.icon
                                : expenseCategory.icon,
                          ),
                        ),
                      ),
                      Text(
                        isIncome == true
                            ? incomeCategory.name
                            : expenseCategory.name,
                        style: Styles.textStyle12,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
