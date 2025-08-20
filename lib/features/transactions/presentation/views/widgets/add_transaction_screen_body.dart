import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_transactions_buttons.dart';

class AddTransactionScreenBody extends StatelessWidget {
  const AddTransactionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(title: Text('Add'), centerTitle: true),
        AddTransactionButtons(),
        SliverPadding(
          padding: EdgeInsets.all(kPadding24),
          sliver: SliverToBoxAdapter(
            child: Text('Last Added', style: Styles.textStyle18),
          ),
        ),
        TransactionsListView(childCount: 6),
      ],
    );
  }
}
