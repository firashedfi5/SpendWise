import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

class StatsScreenBody extends StatelessWidget {
  const StatsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(kPadding24),
          sliver: SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 2.2 / 2,
              child: Container(
                decoration: const BoxDecoration(color: Colors.grey),
                child: const Placeholder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
