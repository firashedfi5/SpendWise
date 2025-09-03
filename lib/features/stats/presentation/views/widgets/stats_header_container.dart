import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';

class StatsHeaderContainer extends StatelessWidget {
  const StatsHeaderContainer({
    super.key,
    required this.amount,
    required this.text,
    required this.icon,
    required this.color,
  });

  final double amount;
  final String text;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: 85,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(kBorderRadius24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(text, style: Styles.textStyle16),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                icon,
                Text(
                  '\$${amount.toString()}',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
