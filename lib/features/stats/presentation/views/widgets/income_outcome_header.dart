import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/enums/income_expenses_enum.dart';
import 'package:spendwise/core/utils/styles.dart';

class IncomeOutcomeHeader extends StatelessWidget {
  const IncomeOutcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: IncomeExpenseEnum.values
              .map(
                (e) => Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: 85,
                  decoration: BoxDecoration(
                    color: e.color.withValues(alpha: 0.13),
                    borderRadius: BorderRadius.circular(kBorderRadius24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(e.title, style: Styles.textStyle16),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            e.icon,
                            Text(
                              '\$${e.amount.toString()}00',
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
