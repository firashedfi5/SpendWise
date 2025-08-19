import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

class CustomToggleButtons extends StatelessWidget {
  const CustomToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(kPadding24, 0, kPadding24, 20),
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 2 / .3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(kBorderRadius24),
            ),
          ),
        ),
      ),
    );
  }
}
