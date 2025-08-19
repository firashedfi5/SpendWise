import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({super.key});

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(kPadding24, 0, kPadding24, 20),
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 2 / .3,
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(kBorderRadius24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _selectedIndex = 0;
                    log(_selectedIndex.toString());
                  },
                  child: AspectRatio(
                    aspectRatio: 6.5 / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kBorderRadius24),
                      ),
                      child: Center(
                        child: Text(
                          'Income',
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _selectedIndex = 1;
                    log(_selectedIndex.toString());
                  },
                  child: AspectRatio(
                    aspectRatio: 6.5 / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(kBorderRadius24),
                      ),
                      child: Center(
                        child: Text(
                          'Expenses',
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
