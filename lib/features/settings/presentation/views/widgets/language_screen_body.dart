import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/language_selector.dart';

class LanguageScreenBody extends StatelessWidget {
  const LanguageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kPadding24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select language', style: Styles.textStyle18),
          SizedBox(height: 10),
          LanguageSelector(),
        ],
      ),
    );
  }
}
