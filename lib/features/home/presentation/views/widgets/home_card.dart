import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/functions/card_gradient.dart';
import 'package:spendwise/core/utils/styles.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      sliver: SliverToBoxAdapter(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius24),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.255,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius24),
              gradient: cardGradient(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kPadding24),
              child: Column(
                children: [
                  Text(
                    'Total Balance',
                    style: Styles.textStyle16.copyWith(color: Colors.white),
                  ),
                  Text(
                    '\$ 4800.00',
                    style: Styles.textStyle50.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_down_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Income',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '\$ 2500.00',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_up_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expenses',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '\$ 800.00',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
