import 'package:flutter/material.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_transactions_buttons.dart';

class AddTransactionScreenBody extends StatelessWidget {
  const AddTransactionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(title: Text('Add'), centerTitle: true),
        AddTransactionButtons(),
      ],
    );
  }
}
