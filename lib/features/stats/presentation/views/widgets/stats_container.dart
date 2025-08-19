import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/stats/presentation/views/widgets/chart.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kBorderRadius24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Statistics',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Apr 01 - Apr 30',
                  style: TextStyle(color: kSecondaryTextColor),
                ),
                const Spacer(),
                const Chart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
