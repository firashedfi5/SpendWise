import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/styles.dart';

class AddTransactionButtons extends StatelessWidget {
  const AddTransactionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.push(AppRouter.kAddIncomeScreen),
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 85,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(kBorderRadius24),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ImageIcon(
                        AssetImage(AssetsData.incomeIcon),
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      Spacer(),
                      Text('Add Income', style: Styles.textStyle16),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => context.push(AppRouter.kAddExpenseScreen),
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 85,
                decoration: BoxDecoration(
                  color: kSecondaryColor.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(kBorderRadius24),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ImageIcon(
                        AssetImage(AssetsData.expenseIcon),
                        color: kSecondaryColor,
                        size: 29,
                      ),
                      Spacer(),
                      Text('Add Expense', style: Styles.textStyle16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
