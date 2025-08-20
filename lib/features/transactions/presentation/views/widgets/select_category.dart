import 'package:flutter/material.dart';
import 'package:spendwise/core/enums/expense_categories.dart';
import 'package:spendwise/core/utils/styles.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

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
                  context: context,
                  builder: (context) => SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Select Category',
                                style: Styles.textStyle18,
                              ),
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
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                              itemBuilder: (context, index) {
                                final category =
                                    ExpenseCategories.values[index];

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: Container(
                                        width: 55,
                                        height: 55,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(child: category.icon),
                                      ),
                                    ),
                                    Text(
                                      category.name,
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
